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
import RxSwift
import RxCocoa

class CustomBinderViewController: UIViewController {
   
   let bag = DisposeBag()
   
   @IBOutlet weak var valueLabel: UILabel!
   
   @IBOutlet weak var colorPicker: UISegmentedControl!
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      colorPicker.rx.selectedSegmentIndex
         .map { index -> UIColor in
            switch index {
            case 0:
               return UIColor.red
            case 1:
               return UIColor.green
            case 2:
               return UIColor.blue
            default:
               return UIColor.black
            }
         }
         .subscribe(onNext: { [weak self] color in
            self?.valueLabel.textColor = color
         })
         .disposed(by: bag)

      colorPicker.rx.selectedSegmentIndex
         .map { index -> String? in
            switch index {
            case 0:
               return "Red"
            case 1:
               return "Green"
            case 2:
               return "Blue"
            default:
               return "Unknown"
            }
         }
         .bind(to: valueLabel.rx.text)
         .disposed(by: bag) 
   }
}



