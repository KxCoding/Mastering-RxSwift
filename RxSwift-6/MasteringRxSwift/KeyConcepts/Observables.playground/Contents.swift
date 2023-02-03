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
 # Observables
 */
print("Hello RxSwift!")

/**
 * Observable의 생성
 *
 * 강사의 경우 이벤트를 발생시키는 역할을 한다고 함
 *
 * 유튜브 채널에 빗대어 이해하면 좋을 것 같음
 * 유튜버가 자신이 만든 컨텐츠에 대한 알림을 만들어내는 역할을 하는 것으로 보임
 *
 * Observable : 유튜버가 만든 유튜브 채널
 * observer : 유튜브 채널을 관찰하는 구독자
 * Disposables : 아직 이 기능에 대한 설명을 제대로 듣지 못했지만
 * 다 본 컨텐츠에 대한 리소스를 해제하기 위해 사용한다고 이해하고 넘어가자
 *
 */

// #1 Observable 0,1 방출 emit 곧 구독자에게 알림을 가한다는 의미임
Observable<Int>.create { (observer) -> Disposable in
    observer.on(.next(0))
    observer.onNext(1)
    
    observer.onCompleted()
    
    return Disposables.create()
}
.take(1)

// #2 위와 마찬가지로 구독자에게 알림을 가하는 기능임
Observable.from([1,2,3]) // from은 우선 몰라도 되고 Observable이 이벤트를 발생시킨다고 이해하자

/**
 * 단순히 위와 같이 Observable이 만들어졌다고 하더라도 이벤트는 전달되지 않는다.
 * 왜냐하면 구독자가 없기 때문에 알림을 가해도 의미가 없다고 이해하자
 *
 */


/**
 * Next Step : Observer 구독하는 것에 대해 알아보자
 * 
 */
