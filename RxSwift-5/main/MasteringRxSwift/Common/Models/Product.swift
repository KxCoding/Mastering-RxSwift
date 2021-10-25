//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
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

import Foundation

struct Product {
   let name: String
   let summary: String
   let category: String
   let price: Int
}

let appleProducts = [
   Product(name: "MacBook Air",
           summary: """
1.6GHz 듀얼 코어 프로세서(최대 3.6GHz Turbo Boost)
256GB 저장 용량
Touch ID
""",
           category: "Mac",
           price: 1_740_000),
   Product(name: "MacBook Pro",
           summary: """
2.3GHz 8코어 프로세서(최대 4.8GHz Turbo Boost)
512GB 저장 용량
Touch Bar 및 Touch ID
""",
           category: "Mac",
           price: 3_490_000),
   Product(name: "iMac Retina 5K",
           summary: """
3.7GHz 6코어 프로세서(최대 4.6GHz Turbo Boost)
2TB 저장 용량
Retina 5K 디스플레이
""",
           category: "Mac",
           price: 2_950_000),
   Product(name: "iMac Pro",
           summary: """
3.2GHz 8코어 Intel Xeon W 프로세서 (최대 4.2GHz Turbo Boost)
1TB SSD 저장 장치
27형 Retina 5K 5120 x 2880 P3 디스플레이
""",
           category: "Mac",
           price: 6_300_000),
   Product(name: "Mac mini",
           summary: """
3.0GHz 6코어 프로세서(최대 4.1GHz Turbo Boost)
256GB 저장 용량
""",
           category: "Mac",
           price: 1_450_000),
   Product(name: "iPad Pro 12.9\"",
           summary: """
실버 / 스페이스 그레이
1TB
Wi-Fi + Cellular
""",
           category: "iPad",
           price: 2_470_000),
   Product(name: "iPad Air",
           summary: """
실버 / 스페이스 그레이 / 골드
256GB
Wi-Fi + Cellular
""",
           category: "iPad",
           price: 999_000),
   Product(name: "iPad",
           summary: """
실버 / 스페이스 그레이 / 골드
128GB
Wi-Fi + Cellular
""",
           category: "iPad",
           price: 720_000),
   Product(name: "Apple Pencil",
           summary: """
호환 기기:
12.9형 iPad Pro(3세대)
11형 iPad Pro
""",
           category: "iPad",
           price: 159_000),
   Product(name: "iPhone Xs",
           summary: """
5.8" Super Retina HD 디스플레이
실버 / 스페이스 그레이 / 골드
A12 Bionic 칩
256GB
듀얼 12MP 와이드 앵글 및 망원 카메라, TrueDepth 카메라
Face ID
""",
           category: "iPhone",
           price: 1_580_000),
   Product(name: "iPhone Xs Max",
           summary: """
6.5" Super Retina HD 디스플레이
실버 / 스페이스 그레이 / 골드
A12 Bionic 칩
256GB
듀얼 12MP 와이드 앵글 및 망원 카메라, TrueDepth 카메라
Face ID
""",
           category: "iPhone",
           price: 1_710_000),
   Product(name: "iPhone Xr",
           summary: """
6.1" Liquid Retina HD 디스플레이
화이트 / 블랙 / 블루 / 옐로 / 코럴
A12 Bionic 칩
256GB
12MP 와이드 앵글, TrueDepth 카메라
Face ID
""",
           category: "iPhone",
           price: 1_200_000),
   
   Product(name: "Apple Watch Series 4",
           summary: """
44mm
실버 알루미늄 케이스와 화이트
스포츠 밴드
GPS + Cellular
""",
           category: "Apple Watch",
           price: 659_000)
]
