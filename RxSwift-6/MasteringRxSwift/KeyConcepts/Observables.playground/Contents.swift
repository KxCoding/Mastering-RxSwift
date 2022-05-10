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
import Foundation


/*
observer - observerable 감시 후 observerable에서 보내는 이벤트 전달, 이것을 구독이라고 함.
observerable - 세가지 이벤트 전달, next로 observer에 저장된 값 전달,
                error가 일어나면 error, 성공하면 completed 전달
 */


// #1

/*
 create 연산자를 이용하여 observerable 연산을 직접 구현, observer param을 이용하여 Disposable 리턴
*/
let o1 = Observable<Int>.create { (observer) -> Disposable in
  observer.on(.next(0)) //구독자에게 next(0) 이벤트가 전달
  observer.onNext(1) // on(.next())와 같음.
  
  observer.onCompleted() //completed 전달 Observable 종료

  return Disposables.create() // 메모리 정리를 위한 Disposable 리턴
}

// #2
/*
 #1과 같은 연산자, custom한 연산을 원한다면 #1에서 추가 코드 작성.
 구독하는 시점에 next() 방출
*/

Observable.from([0, 1])
