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
 RxCocoa를 import 해야 사용할 수 있으며, 각 subject를 래핑하고 있다.
 
 PublishRelay - Publish Subject를 래핑
 BehaviorRelay - Behavior Subject를 래핑
 ReplayRelay - next event만 전달하기 때문에 종료되지 않고, 구독자가 disposed 되어야 종료
               UI에 많이 사용
 */

let bag = DisposeBag()

// PublishRelay
let pRelay = PublishRelay<Int>()

pRelay.subscribe { print("1: \($0)") }
  .disposed(by: bag)

// onNext 대신 accept를 사용한다
pRelay.accept(1)


// BehaviorRelay
// 가장 최근의 이벤트가 전달 next(2)
let bRelay = BehaviorRelay(value: 1)
bRelay.accept(2)
bRelay.subscribe { print("2: \($0)")}

print("value!", bRelay.value)

// value는 읽기 전용이며 값을 바꿀수 없다 바꾸려면 accept 가장 최근의 이벤트 next(3)이 전달된다.
bRelay.accept(3)

// ReplayRelay
// 마지막 값 3개가 출력 next(8), next(9), next(10)
let rRelay = ReplayRelay<Int>.create(bufferSize: 3)

(1...10).forEach { rRelay.accept($0) }

rRelay.subscribe { print("3: \($0)") }
  .disposed(by: bag)









