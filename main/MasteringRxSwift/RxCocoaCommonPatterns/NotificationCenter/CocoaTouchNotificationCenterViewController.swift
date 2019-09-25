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

class CocoaTouchNotificationCenterViewController: UIViewController {
   
   @IBOutlet weak var textView: UITextView!
   
   var tokens = [NSObjectProtocol]()
   
   deinit {
      tokens.forEach { NotificationCenter.default.removeObserver($0) }
   }
   
   @IBAction func toggleKeyboard(_ sender: Any) {
      if textView.isFirstResponder {
         textView.resignFirstResponder()
      } else {
         textView.becomeFirstResponder()
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      var token = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
         guard let strongSelf = self else { return }
         
         if let frameValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let height = frameValue.cgRectValue.height
            
            var inset = strongSelf.textView.contentInset
            inset.bottom = height
            
            var scrollInset = strongSelf.textView.scrollIndicatorInsets
            scrollInset.bottom = height
            
            UIView.animate(withDuration: 0.3, animations: {
               strongSelf.textView.contentInset = inset
               strongSelf.textView.scrollIndicatorInsets = scrollInset
            })
         }
      })
      tokens.append(token)
      
      token = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
         
         guard let strongSelf = self else { return }
         
         var inset = strongSelf.textView.contentInset
         inset.bottom = 0
         
         var scrollInset = strongSelf.textView.scrollIndicatorInsets
         scrollInset.bottom = 0
         
         UIView.animate(withDuration: 0.3, animations: {
            strongSelf.textView.contentInset = inset
            strongSelf.textView.scrollIndicatorInsets = scrollInset
         })
      })
      tokens.append(token)
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      if textView.isFirstResponder {
         textView.resignFirstResponder()
      }
   }
}
