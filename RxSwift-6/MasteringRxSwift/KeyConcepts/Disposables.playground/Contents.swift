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
 # Disposables
 */
/**
 * Disposable은 Observable이 방출하는 기능이 아님
 *
 * 제어의 역전에 의해 Rx 프레임워크가 옵저버블의 기능이 끝날 때 onDisposed를 자동으로 방출하지만
 * 위와 같이 명시적으로 onDisposed를 호출하는 이유는 해당 시점에 어떠한 명령을 할지 유저가 결정하는 것일뿐
 *
 * onDisposed는 프레임워크가 관리하지만
 * Rx 공식 문서상에서는 Disposed를 직접 관리할 것을 권장함
 */

// #1 옵저버블
let subscription1 = Observable.from([1,2,3])
    .subscribe(
        onNext: { element in
            print("onNext: \(element)")
        }, onError: { error in
            print("onError: \(error)")
        }, onCompleted: {
            print("Completed")
        }, onDisposed: {
            print("Disposed")
        })

/**
 * Disposable 리소스 정리에 사용
 *
 * func subscribe(...) -> Disposable : 구독 시 반환하게 되는 값이 리소스 정리 객체
 */

subscription1.dispose() // 리소스 반환 기능을 제공하지만 Rx 공식 문서가 추천하는 방법은 아님

/**
 * Rx 권장 리소스 반환 방법에 대해
 *
 * DisposeBag()을 통해 자원을 해제하기
 * DisposeBag은 할당된 변수가 해제될 때 모든 자원을 반환함
 */

var bag = DisposeBag()
bag = DisposeBag() // 다시 할당하면 이전 모든 자원이 해제됨

// #2 옵저버블
Observable.from([1,2,3])
    .subscribe {
        print($0)
    }
    .disposed(by: bag)
// 위와 같이 구독자가 리소스 반환 요청을 백에 할 수 있음
// 모두 다 본 영상을 내 재생 목록에서 지우는 것과 같은 개념으로 생각하면 편함

// #3 옵저버블 - 매 초마다 초를 출력
let subscription2 = Observable<Int>
    .interval(.seconds(1), scheduler: MainScheduler.instance)
    .subscribe(
        onNext: { element in
            print("onNext: \(element)")
        }, onError: { error in
            print("onError: \(error)")
        }, onCompleted: {
            print("Completed")
        }, onDisposed: {
            print("Disposed")
        })

/**
 * 옵저버블 3과 같이 중단이 필요한 경우에 직접 자원 관리를 해주는데 Rx 연산자 중에 하단 코드보다 효율적인 녀석을 제공
 */
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    subscription2.dispose()
}
