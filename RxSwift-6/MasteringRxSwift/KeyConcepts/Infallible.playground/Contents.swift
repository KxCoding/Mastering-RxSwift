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
/*
 1. 절대 보증할 수 있는
 2. 결코 틀리지 않은
 3. 절대 옳은
 
새로운 형태의 Observable
error는 방출하지 않음.
 
 */

enum MyError: Error {
    case unknown
}

//Observable
let observable = Observable<String>.create { observer in
    observer.onNext("Hello")
    observer.onNext("Observable")
    
    //observer.onError(MyError.unknown)
    
    observer.onCompleted()
    
    return Disposables.create()
}

//Infallible - InfallibleEvent에는 next, completed만 있다. error는 없어 방출하지 않는다.
let infallible = Infallible<String>.create { observer in
  observer(.next("Hello"))
  observer(.completed)
  
  return Disposables.create()
}











