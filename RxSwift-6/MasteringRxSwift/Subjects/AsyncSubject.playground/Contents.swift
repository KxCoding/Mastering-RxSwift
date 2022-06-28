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

/*:
 # AsyncSubject
 */
/*
 이벤트를 전달하는 시점이 다른 subject와 다름.
 서브젝트로 completed 이벤트가 전달되는 시점에 가장 마지막으로 전달 된 next 이벤트를 구독자에게 전달한다.
 */

let bag = DisposeBag()

enum MyError: Error {
   case error
}

let subject = AsyncSubject<Int>()

subject
  .subscribe { print($0) }
  .disposed(by: bag)

// next 이벤트를 전달하였지만 onCompleted 이벤트를 전달 하지않아 구독자에게 전달되지 않는다
subject.onNext(1)
subject.onNext(2)
subject.onNext(3)

// onCompleted 이벤트를 전달하면 가장 최근의 next이벤트가 전달된다 next(3)
// 이벤트가 없다면, completed만 전달된다.
subject.onCompleted()

// error 이벤트를 전달하면 next 이벤트가 전달되지 않고 종료된다.
subject.onError(MyError.error)



