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

class CocoaTouchAlertViewController: UIViewController {
   
   @IBOutlet weak var colorView: UIView!
   
   @IBAction func showAlertWithAction(_ sender: Any) {
      let alert = UIAlertController(title: "Current Color", message: colorView.backgroundColor?.rgbHexString, preferredStyle: .alert)
      
      let okAction = UIAlertAction(title: "Ok", style: .default) { [weak self] (action) in
         print(self?.colorView.backgroundColor?.rgbHexString ?? "")
      }
      alert.addAction(okAction)
      
      present(alert, animated: true, completion: nil)
   }
   
   @IBAction func showAlertWithTwoActions(_ sender: Any) {
      let alert = UIAlertController(title: "Reset Color", message: "Reset to black color?", preferredStyle: .alert)
      
      let resetAction = UIAlertAction(title: "Reset", style: .destructive) { [weak self] (action) in
         self?.colorView.backgroundColor = UIColor.black
      }
      alert.addAction(resetAction)
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      alert.addAction(cancelAction)
      
      present(alert, animated: true, completion: nil)
   }
   
   @IBAction func showActionSheet(_ sender: Any) {
      let actionSheet = UIAlertController(title: "Change Color", message: "Choose one", preferredStyle: .actionSheet)
      
      for color in MaterialBlue.allColors {
         let colorAction = UIAlertAction(title: color.rgbHexString, style: .default) { [weak self] (action) in
            self?.colorView.backgroundColor = color
         }
         actionSheet.addAction(colorAction)
      }
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      actionSheet.addAction(cancelAction)
      
      present(actionSheet, animated: true, completion: nil)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
   }   
}
