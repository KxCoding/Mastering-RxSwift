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







/**
 *
 * ---------------                 ---------------
 * ----   Observable -----          < --- >              ----- Observer --------
 * ---------------                 ---------------
 *
 * 1개의 옵저버블은 1개의 옵저버만 받을 수 있음
 *
 * ---------------                 ---------------                 ---------------
 * ----   Observable -----      ----------------->          -----   Subject   -------           <-----      --- Observer --
 * ---------------                 ---------------                 ---------------
 *
 * 서브젝트는 옵저버블과 옵저버 역할을 동시에 수행함
 * 두 속성을 모두 지니고 있기 때문에 각각의 옵저버블 그리고 옵저버 모두의 매개 역할을 할 수 있음
 *
 * Subject = 옵저버블 + 옵저버
 *
 */


/**
 * 서브젝트 개괄 ...
 *
 * 퍼블리시 서브젝트 : 서브젝트로 전달되는 새로운 이벤트를 구독자로 전달함
 * 비헤이비어 서브젝트 : 생성 시점에 시작 이벤트를 지정, 서브젝트로 전달되는 이벤트 중에서 가장 마지막 최신 이벤트를 저장 새로운 구독자가 생기면 최신 이벤트를 전달함
 * 리플레이 서브젝트 : 하나 이상의 최신 이벤트를 버퍼에 저장
 * 어싱크 서브젝트 : 컴플리트 이전 시점 마지막 이벤트를 구독자에게 전달
 *
 * 퍼블리시 릴레이 :  퍼블리시 서브젝트를 래핑하고 있음, Next 이벤트만 받고 (Complete 및 Error 는 무시됨)
 * 비헤이비어 릴레이 : 비헤이비어 서브젝트를 래핑하고 있음,  Next 이벤트만 받고 (Complete 및 Error 는 무시됨)
 */




import UIKit
import RxSwift

/*:
 # PublishSubject
 */

print("퍼블리시 서브젝트가 시작됨.")

/**
 * Publish Subject
 */

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}

/**
 * 옵저버블이 이벤트를 전달할 때 onNext 사용함
 * 서브젝트도 옵저버이기 때문에 onNext를 사용할 수 있음
 *
 * 생성된 시점에는 서브젝트 내에 아무것도 없음
 * 옵저버가 생성 시점에 구독해도 아무런 정보가 없음
 */
let subject = PublishSubject<String>()
subject.onNext("Hello World!")

/**
 * subject.onNext("Hello World!") 는 구독 이전에 발생한 이벤트
 * 그렇기 때문에 o1에서는 해당 이벤트 내용을 알 수 없음
 *
 * o = observer
 *
 * o1은 구독 후 발생한 2번의 이벤트를 모두 캐치
 * o2는 구독 후 발생한 1번의 이벤트를 모두 캐치
 */
let o1 = subject.subscribe { print(">> 1", $0) }
o1.disposed(by: disposeBag)

subject.onNext("RxSwift!")

let o2 = subject.subscribe { print(">> 2", $0) }
o2.disposed(by: disposeBag)

subject.onNext("Subject!")

/**
 * onComplete 시점에 o1, o2, o3 모두 completed를 받게됨
 */
//subject.onCompleted()

/**
 * onError 시점에 o1, o2, o3 모두 error 획득
 */
class TempError: Error { }
subject.onError(TempError())

let o3 = subject.subscribe { print(">> 3", $0) }
o3.disposed(by: disposeBag)



