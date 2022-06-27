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
 # PublishSubject
 */
/*
 비어있는 생성자를 사용, Subject로 전달하는 새로운 이벤트를 observer에게 전달
 가장 기본의 subject
 */

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}

// 비어있는 상태로 생성, 내부의 이벤트를 저장하지 않음. observer 혹은 observable
// onNext로 이벤트를 추가 (observable)
let subject = PublishSubject<String>()
subject.onNext("Hello")

// subscribe로 구독 (observer)
// 구독 이후에 이벤트를 추가해야 전달이 된다. 위는 전달되지 않는다
let o1 = subject.subscribe { print(">> 1", $0)}
o1.disposed(by: disposeBag)
subject.onNext("RxSwift")

// subject는 Subject만 전달된다.
let o2 = subject.subscribe { print(">> 2", $0) }
o2.disposed(by: disposeBag)
subject.onNext("Subject")

//onCompleted를 전달하면 종료된다.
subject.onCompleted()

//onError를 전달하면 모든 구독자에게 error가 전달된다. 모든 이벤트가 사라짐 원하지 않으면 replay사용.
subject.onError(MyError.error)


let o3 = subject.subscribe { print(">> 3", $0) }
o3.disposed(by: disposeBag)



