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

enum ValidationError: Error {
   case notANumber
}

class DriverViewController: UIViewController {
   
   let bag = DisposeBag()
   
   @IBOutlet weak var inputField: UITextField!
   
   @IBOutlet weak var resultLabel: UILabel!
   
   @IBOutlet weak var sendButton: UIButton!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      let result = inputField.rx.text
         .flatMapLatest { validateText($0) }

      result
         .map { $0 ? "Ok" : "Error" }
         .bind(to: resultLabel.rx.text)
         .disposed(by: bag)

      result
         .map { $0 ? UIColor.blue : UIColor.red }
         .bind(to: resultLabel.rx.backgroundColor)
         .disposed(by: bag)

      result
         .bind(to: sendButton.rx.isEnabled)
         .disposed(by: bag)
      
   }
}


func validateText(_ value: String?) -> Observable<Bool> {
   return Observable<Bool>.create { observer in
      print("== \(value ?? "") Sequence Start ==")
      
      defer {
         print("== \(value ?? "") Sequence End ==")
      }
      
      guard let str = value, let _ = Double(str) else {
         observer.onError(ValidationError.notANumber)
         return Disposables.create()
      }
      
      observer.onNext(true)
      observer.onCompleted()
      
      return Disposables.create()
   }
}
