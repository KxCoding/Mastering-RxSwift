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

/*
 실제로 이벤트가 전달되는 시점은 Observer가 구독을 시작하는 시점.
 Observer 구독은 subscribe를 이용
 
 Observer는 동시에 두개 이상의 이벤트를 처리하지 않음
 Observable은 Observer의 하나의 이벤트를 처리 후 이어지는 이벤트를 처리, 동시에 처리 하지 않는다.
 */

// o1에 Observable 저장
let o1 = Observable<Int>.create { (observer) -> Disposable in
   observer.on(.next(0))
   observer.onNext(1)
   
   observer.onCompleted()
   
   return Disposables.create()
}

// #1
// o1 element을 꺼내서 사용
o1.subscribe {
  print("====Strat====")
  print($0)
  
  if let elem = $0.element {
    print(elem)
  }
  
  print("====End====")
}

// #2
// o1의 element만 사용
o1.subscribe(onNext: { elem in
  print(elem)
})

Observable.from([1, 2, 3])
    


