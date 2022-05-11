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
 # ReplaySubject
 */
/*
 Behavior는 가장 최신의 이벤트만 저장하지만
 Replay는 모든 이벤트만 저장한다. 지정된 버퍼 크기만큼 최신 이벤트를 저장하고 새로운 구독자에게 전달
 버퍼는 메모리에게 저장되기 때문에 메모리를 신경써야 하며, 필요 이상의 버퍼 사용은 하지 않는게 좋다
 */

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}
// creat 메소드와 버퍼를 사용
// 1...10까지의 next 이벤트를 전달하고, ReplaySubject 구독하면 버퍼 3으로 인해 최신 8, 9, 10이 전달된다.
//
let rs = ReplaySubject<Int>.create(bufferSize: 3)

(1...10).forEach { rs.onNext($0) }

rs.subscribe { print("Observer 1 >>", $0) }
  .disposed(by: disposeBag)

rs.subscribe { print("Observer 2 >>", $0) }
  .disposed(by: disposeBag)

// 이벤트를 추가하면 8이 사라지고 9, 10, 11이 전달된다,
rs.onNext(11)

rs.subscribe { print("Observer 3 >>", $0) }
  .disposed(by: disposeBag)

//rs.onError(MyError.error)
rs.onCompleted()

//onCompleted or error 후 구독자를 추가하면 9, 10, 11, completed가 전달된다.
rs.subscribe { print("Observer 4 >>", $0) }
  .disposed(by: disposeBag)


