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

class CustomControlEventViewController: UIViewController {
   
   let bag = DisposeBag()
   
   @IBOutlet weak var inputField: UITextField!
   
   @IBOutlet weak var countLabel: UILabel!
   
   @IBOutlet weak var doneButton: UIButton!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      inputField.borderStyle = .none
      inputField.layer.borderWidth = 3
      inputField.layer.borderColor = UIColor.gray.cgColor
      
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: inputField.frame.height))
      inputField.leftView = paddingView
      inputField.leftViewMode = .always
      
      inputField.rx.text
         .map { $0?.count ?? 0 }
         .map { "\($0)" }
         .bind(to: countLabel.rx.text)
         .disposed(by: bag)
      
      doneButton.rx.tap
         .subscribe(onNext: { [weak self] _ in
            self?.inputField.resignFirstResponder()
         })
         .disposed(by: bag)
      
      inputField.delegate = self
   }
}

extension CustomControlEventViewController: UITextFieldDelegate {
   func textFieldDidBeginEditing(_ textField: UITextField) {
      textField.layer.borderColor = UIColor.red.cgColor
   }

   func textFieldDidEndEditing(_ textField: UITextField) {
      textField.layer.borderColor = UIColor.gray.cgColor
   }
}


