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

class ControlPropertyControlEventCocoaTouchViewController: UIViewController {
   
   @IBOutlet weak var colorView: UIView!
   
   @IBOutlet weak var redSlider: UISlider!
   @IBOutlet weak var greenSlider: UISlider!
   @IBOutlet weak var blueSlider: UISlider!
   
   @IBOutlet weak var redComponentLabel: UILabel!
   @IBOutlet weak var greenComponentLabel: UILabel!
   @IBOutlet weak var blueComponentLabel: UILabel!
   
   @IBAction func sliderChanged(_ sender: Any) {
      let redComponent = CGFloat(redSlider.value) / 255
      let greenComponent = CGFloat(greenSlider.value) / 255
      let blueComponent = CGFloat(blueSlider.value) / 255
      
      let color = UIColor(red: redComponent, green: greenComponent, blue: blueComponent, alpha: 1.0)
      colorView.backgroundColor = color
      
      updateComponentLabel()
   }
   
   @IBAction func resetColor(_ sender: Any) {
      colorView.backgroundColor = UIColor.black
      
      redSlider.value = 0
      greenSlider.value = redSlider.value
      blueSlider.value = redSlider.value
      
      updateComponentLabel()
   }
   
   private func updateComponentLabel() {
      redComponentLabel.text = "\(Int(redSlider.value))"
      greenComponentLabel.text = "\(Int(greenSlider.value))"
      blueComponentLabel.text = "\(Int(blueSlider.value))"
   }
}
