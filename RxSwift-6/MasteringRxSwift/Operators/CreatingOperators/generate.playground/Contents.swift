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
 # generate
 */
/*
 값이 바뀌는 조건이 필요할 때 사용
 4개의 파라미터를 받는다.
 initialState = 시작 값
 condition = true 조건 설정, false일 때 종료
 iterate = 값을 바꾸는 코드를 전달
 */

let disposeBag = DisposeBag()
let red = "🔴"
let blue = "🔵"

// 0으로 시작하여 10 이하, 값을 2씩 증가
Observable.generate(initialState: 0, condition: { $0 <= 10 }, iterate: { $0 + 2 })
  .subscribe { print($0) }
  .disposed(by: disposeBag)

// red 시작, 문자열의 길이가 15 미만, 현재 문자열 뒤에 다른 컬러 추가
Observable.generate(initialState: red, condition: { $0.count < 15 }, iterate: { $0.count.isMultiple(of: 2) ? $0 + red : $0 + blue })
  .subscribe { print($0) }
  .disposed(by: disposeBag)




