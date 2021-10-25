//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

struct MaterialBlue {
   static let primary = UIColor(hexString: "#2196F3")
   static let i50     = UIColor(hexString: "#E3F2FD")
   static let i100    = UIColor(hexString: "#BBDEFB")
   static let i200    = UIColor(hexString: "#90CAF9")
   static let i300    = UIColor(hexString: "#64B5F6")
   static let i400    = UIColor(hexString: "#42A5F5")
   static let i500    = UIColor(hexString: "#2196F3")
   static let i600    = UIColor(hexString: "#1E88E5")
   static let i700    = UIColor(hexString: "#1976D2")
   static let i800    = UIColor(hexString: "#1565C0")
   static let i900    = UIColor(hexString: "#0D47A1")
   static let a100    = UIColor(hexString: "#82B1FF")
   static let a200    = UIColor(hexString: "#448AFF")
   static let a400    = UIColor(hexString: "#2979FF")
   static let a700    = UIColor(hexString: "#2962FF")
   
   static let allColors = [primary, i50, i100, i200, i300, i400, i500, i600, i700, i800, i900, a100, a200, a400, a700]
}

extension UIColor {
   convenience init(hexString: String) {
      var red: CGFloat    = 1.0
      var green: CGFloat  = 1.0
      var blue: CGFloat   = 1.0
      var alpha: CGFloat  = 1.0
      
      if let color = hexString.parseHexColorString() {
         color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
      }
      
      self.init(red:red, green:green, blue:blue, alpha:alpha)
   }
   
   
}

extension String {
   private var len: Int {
      return count
   }
   
   /// A Boolean value that indicates whether the receiver is hexadecimal color string
   var isHexColorString: Bool {
      if !hasPrefix("#") || len < 4 || len > 9 {
         return false
      }
      
      do {
         let pattern = "^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3}|[A-Fa-f0-9]{4}|[A-Fa-f0-9]{8})$"
         let regex = try NSRegularExpression(pattern: pattern, options: [])
         let range = NSRange(location: 0, length: len)
         return regex.numberOfMatches(in: self, options: [], range: range) == 1
      } catch {
         print(error)
      }
      
      return false
   }
   
   var redComponent: CGFloat? {
      guard isHexColorString else { return nil }
      
      switch len {
      case 4, 5:
         return parse(subRange: 1...2)
      case 7, 9:
         return parse(subRange: 1...3)
      default:
         return nil
      }
   }
   
   
   var greenComponent: CGFloat? {
      guard isHexColorString else { return nil }
      
      switch len {
      case 4, 5:
         return parse(subRange: 2...3)
      case 7, 9:
         return parse(subRange: 3...5)
      default:
         return nil
      }
   }
   
   
   var blueComponent: CGFloat? {
      guard isHexColorString else { return nil }
      
      switch len {
      case 4, 5:
         return parse(subRange: 3...4)
      case 7, 9:
         return parse(subRange: 5...7)
      default:
         return nil
      }
   }
   
   
   var alphaComponent: CGFloat? {
      guard isHexColorString else { return nil }
      
      switch len {
      case 5:
         return parse(subRange: 4...5)
      case 9:
         return parse(subRange: 7...9)
      default:
         return 255.0
      }
   }
   
   
   var UIColorValue: UIColor? {
      return parseHexColorString()
   }
   
   func parseHexColorString() -> UIColor? {
      if let r = redComponent, let g = greenComponent, let b = blueComponent {
         let a = alphaComponent ?? 255
         
         return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a/255.0)
      }
      
      return nil
   }
   
   fileprivate func parse(subRange: CountableClosedRange<Int>) -> CGFloat? {
      let substringRange = Range<String.Index>(uncheckedBounds: (index(startIndex, offsetBy: subRange.lowerBound), index(startIndex, offsetBy: subRange.upperBound)))
      
      var value = String(self[substringRange])
      
      if value.count == 1 {
         value = value + value
      }
      
      var result: UInt32 = 0
      let scanner = Scanner(string: value)
      if scanner.scanHexInt32(&result) {
         return CGFloat(result)
      }
      
      return nil
   }
}


extension UIColor {
   
   var rgbHexString: String {
      return toHexString(includeAlpha: false)
   }
   
   private func toHexString(includeAlpha: Bool = true) -> String {
      var normalizedR: CGFloat = 0
      var normalizedG: CGFloat = 0
      var normalizedB: CGFloat = 0
      var normalizedA: CGFloat = 0
      
      getRed(&normalizedR, green: &normalizedG, blue: &normalizedB, alpha: &normalizedA)
      
      let r = Int(normalizedR * 255)
      let g = Int(normalizedG * 255)
      let b = Int(normalizedB * 255)
      let a = Int(normalizedA * 255)
      
      if includeAlpha {
         return String(format: "#%02X%02X%02X%02X", r, g, b, a)
      }
      
      return String(format: "#%02X%02X%02X", r, g, b)
   }
}
