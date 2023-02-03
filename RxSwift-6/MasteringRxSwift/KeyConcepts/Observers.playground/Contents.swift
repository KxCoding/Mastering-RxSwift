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
 # Observers
 */
/**
 * This Step : 옵저버블은 이벤트를 방출하고 종료된다 받아줄 녀석을 만들어 줘야하는데 그게 바로 Observer
 * => 현실에 비유하자면 Observable 곧 유튜브 채널과 같은 기능을 하는 이 녀석이 알림을 가한다
 *   받아줄 구독자를 만들어주자
 *
 *  유튜브 채널
 */
let observer1 = Observable<Int>.create { (observer) -> Disposable in
   observer.on(.next(0))
   observer.onNext(1)
   observer.onCompleted()
   
   return Disposables.create()
}

/**
 * Observable에 대한 구독을 하게 되면 onNext로부터 Completed 시점까지 기능이 작동하고 마무리 된다
 *
 * 유튜브 구독자
 */
observer1.subscribe {
    print($0)
    
    if let element = $0.element {
        print(element) // observer가 받은 아이템 중 필요한 내용을 출력할 수 있다
    }
}

/**
 * Observable1과 형태는 다르지만 from 연산자에 completed 함수가 내장되어 있는 것이라고 할 수 있다
 *
 * 유튜브 채널 2
 */

let observer2 = Observable.from([1, 2, 3, 4, 5])

/**
 * 유튜브 구독자 2
 */
observer2.subscribe(onNext: { element in
    print("===START===")
    
    print(element)
    
    print("===END===")
})

/**
 * 유튜브 구독자 3
 */
observer2.subscribe(onNext: { element in
    print("===START2===")
    
    print(element)
    
    print("===END2===")
})

/**
 * Tip
 *
 * 옵저버블은 동시에 여러개의 이벤트를 처리하지 않는다
 * 각 옵저버의 기능이 끝나고 다음 이벤트를 처리한다.
 *
 * 원래 그런거 아님?
 * 어떤 의미로 이해를 해야하는지 정확하게 이해하지 못함
 *
 * 유튜브 구독자 2
 * 유튜브 구독자 3 의 옵저버가 섭스크라이브될 때 동시에 실행되지 않고
 * 유튜브 구독자 2가 먼저 선행되고
 * 유튜브 구독자 3이 후행되는 것을 확인함
 */

