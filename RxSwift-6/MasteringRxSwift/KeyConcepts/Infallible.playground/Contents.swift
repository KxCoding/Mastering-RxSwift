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
 # Infallible
 */
/**
 * Infallible (RxSwift 6+에서 생김)
 * : 절대 실패하지 않는
 *
 * [Observable] ------------------> [Observer]
 *        (Next, Error, Completed)
 *
 * : 옵저버블의 유형으로 무조건 성공하기 때문에 Error가 빠짐
 * [Infallible] ------------------> [Observer]
 *        (Next, Completed)
 */
let observable = Observable<String>.create { observer in
    observer.onNext("Hello")
    observer.onNext("Observable")
    
    //observer.onError(MyError.unknown)
    
    observer.onCompleted()
    
    return Disposables.create()
}

/**
 * Error 방출하지 않는 옵저버블이며 onNext 대신 하단과 같이 정리해야 한다
 */
let infallible = Infallible<String>.create { observer in
    observer(.next("Hello!"))
    observer(.completed)
    
    return Disposables.create()
}
