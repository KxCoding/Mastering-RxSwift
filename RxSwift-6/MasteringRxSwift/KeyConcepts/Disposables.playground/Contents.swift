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

//#1
// 순서대로 출력, onDisposed를 설정해두면 dispose() 되는 시점에 onDisposed를 호출한다. 호출하기 원하면 #1처럼 코드 작성

let subscription1 = Observable.from([1, 2, 3])
  .subscribe(onNext: { elem in
    print("Next", elem)
  }, onError: { error in
    print("Error", error)
  }, onCompleted: {
    print("Completed")
  }, onDisposed: {
    print("Disposed")
  })

subscription1.dispose() // 이 방식으로 리소스 해제해도 되지만 DisposeBag을 사용하는게 좋다. (아래)

var bag = DisposeBag()

// #2
// 위와 마찬가지로 순서대로 출력, onDisposed는 호출되지 않는다. 리소스 정리 하지 않아도 되지만 서류상 하는게 좋다고 함.
Observable.from([1, 2, 3])
  .subscribe {
    print($0)
  }
  .disposed(by: bag) //.disposed(by: )를 사용하여 리소스 해제. 이런 식으로 사용하는 것이 좋다.

bag = DisposeBag() // 새로운 DisposeBag 넣어주면 기존 DisposeBag 해제



//1씩 증가하는 정수를 1초 간격으로 방출
let subscroption2 = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
  .subscribe(onNext: { elem in
    print("Next", elem)
  }, onError: { error in
    print("Error", error)
  }, onCompleted: {
    print("Completed")
  }, onDisposed: {
    print("Disposed")
  })

//무한정 방출하여 방출 중단을 위해 dispose 사용, completed를 호출하지 않아 추천하진 않는다. 특정 시점에 중단을 원하면 takeUntile 하는 것이 좋다.
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
  subscroption2.dispose()
}










