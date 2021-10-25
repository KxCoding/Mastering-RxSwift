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

let booksUrlStr = "https://kxcoding-study.azurewebsites.net/api/books"
let stringValueUrlStr = "https://kxcoding-study.azurewebsites.net/api/string"

struct Book: Codable {
   let id: Int
   let title: String
   let desc: String
   let link: String
   
   enum CodingKeys: String, CodingKey {
      case id
      case title
      case desc = "description"
      case link = "yes24Link"
   }
}

struct BookList: Codable {
   let list: [Book]
   let totalCount: Int
   let code: Int
   let message: String?
   
   static func parse(data: Data) -> [Book] {
      var list = [Book]()
      
      do {
         let decoder = JSONDecoder()
         let bookList = try decoder.decode(BookList.self, from: data)
         
         if bookList.code == 200 {
            list = bookList.list
         }
      } catch {
         print(error)
      }
      
      return list
   }
   
   static func parse(json: Any) -> [Book] {
      let data = try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
      
      return parse(data: data)
   }
}

