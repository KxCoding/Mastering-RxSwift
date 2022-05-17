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
import RxCocoa

/*:
 # Relay
 */
/*
 RxCocoa를 inport 해야 사용할 수 있으며, 각 subject를 래핑하고 있다.
 
 PublishRelay
 BehaviorRelay
 ReplayRelay
 
 next event만 전달하기 때문에 종료되지 않고, 구독자가 disposed 되어야 종료
 UI에 많이 사용
 */

let bag = DisposeBag()

// PublishRelay
// onNext 대신 accept를 사용한다
let prelay = PublishRelay<Int>()

prelay.subscribe { print("1: \($0)") }
  .disposed(by: bag)

prelay.accept(1)


// BehaviorRelay
// 가장 최근의 이벤트가 전달 next(2)
// value는 읽기 전용이며 값을 바꿀수 없다 바꾸려면 accept 가장 최근의 이벤트 next(3)이 전달된다.
let brelay = BehaviorRelay(value: 1)
brelay.accept(2)
brelay.subscribe { print("2: \($0)")}

print(brelay.value)

brelay.accept(3)


// ReplayRelay
// 마지막 값 3개가 출력 next(8), next(9), next(10)
let rrelay = ReplayRelay<Int>.create(bufferSize: 3)

(1...10).forEach { rrelay.accept($0) }

rrelay.subscribe { print("3: \($0)") }
  .disposed(by: bag)









