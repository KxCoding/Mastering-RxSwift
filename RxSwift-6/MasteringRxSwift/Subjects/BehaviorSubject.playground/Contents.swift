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
 # BehaviorSubject
 */
/*
  생성 시점에 시작 이벤트를 지정,
  Subject로 전달되는 이벤트 중에서 가장 마지막 전달 된 이벤트를 저장해 두었다가 새로운 구독자에게 전달
  Behavior를 생성할 때는 하나의 값을 전달한다.
 */

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}

// 비어있는 생성자이기 떄문에 구독자에게 전달하는 이벤트가 없다
let p = PublishSubject<Int>()
p.subscribe { print("PublishSubject >>", $0) }
  .disposed(by: disposeBag)



// 생성할 때의 사용했던 생성자가 저장되어 구독자에게 0을 전달한다.
let b = BehaviorSubject<Int>(value: 0) //값을 넣어 생성
b.subscribe { print("BehaviorSubject >>", $0) }
  .disposed(by: disposeBag)

b.onNext(1)

// 생성자 1을 저장하고 있어 0 -> 1로 교체되어 이벤트를 전달한다.
b.subscribe { print("BehaviorSubject2 >>", $0) }
  .disposed(by: disposeBag)


//onCompleted를 하면 모든 구독자에게 Completed를 전달
b.onCompleted()

//onError 하면 모든 구독자에게 error를 전달
b.onError(MyError.error)

// 위에서 Completed를 했기 때문에 Completed 전달
b.subscribe { print("BehaviorSubject3 >>", $0) }
  .disposed(by: disposeBag)













