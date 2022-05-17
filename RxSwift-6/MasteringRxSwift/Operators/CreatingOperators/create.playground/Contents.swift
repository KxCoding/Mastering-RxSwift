//
//  Mastering RxSwift
//  Copyright (c) KxCoding <help@kxcoding.com>
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
import Dispatch

/*:
 # create
 */
/*
  observable이 동작하는 방식을 직접 구현
  Disposable 방출
 */

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}

Observable<String>.create { (observer) -> Disposable in
  guard let url = URL(string:  "http://www.apple.com") else {
    observer.onError(MyError.error)
    return Disposables.create() // Disposables
  }
  
  guard let html = try? String(contentsOf: url, encoding: .utf8) else {
    observer.onError(MyError.error)
    return Disposables.create()
  }
  
  observer.onNext(html) // 정상적인 url을 방출, 존재하지 않는다면 error 방출
  observer.onCompleted()
  
  observer.onNext("After completed")
  // completed 후 새로운 문자열을 방출하면 더 이상 이벤트를 방출하지 않는다.
  // 종료하고 싶다면 onError나, onCompleted 호출해야함.
  
  return Disposables.create()
}
.subscribe { print(($0)) }
.disposed(by: disposeBag)
