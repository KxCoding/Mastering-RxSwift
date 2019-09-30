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

import UIKit

class CocoaTouchURLSessionViewController: UIViewController {
   
   @IBOutlet weak var listTableView: UITableView!
   
   var list = [Book]()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      DispatchQueue.global().async {
         self.fetchBookList()
      }
   }

   
   func fetchBookList() {
      DispatchQueue.main.async {
         UIApplication.shared.isNetworkActivityIndicatorVisible = true
      }
      
      guard let url = URL(string: booksUrlStr) else {
         fatalError("Invalid URL")
      }
      
      let session = URLSession.shared
      
      let task = session.dataTask(with: url) { [weak self] (data, response, error) in
         defer {
            DispatchQueue.main.async { [weak self] in
               self?.listTableView.reloadData()
               UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
         }
         
         if let error = error {
            print(error)
            return
         }
         
         guard let httpResponse = response as? HTTPURLResponse else {
            print("Invalid Response")
            return
         }
         
         guard (200...299).contains(httpResponse.statusCode) else {
            print(httpResponse.statusCode)
            return
         }
         
         guard let data = data else {
            fatalError("Invalid Data")
         }
         
         do {
            let decoder = JSONDecoder()
            let bookList = try decoder.decode(BookList.self, from: data)
            
            if bookList.code == 200 {
               self?.list = bookList.list
            } else {
               self?.list = [Book]()
            }
         } catch {
            print(error)
         }
      }
      task.resume()
   }
}

extension CocoaTouchURLSessionViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      let target = list[indexPath.row]
      cell.textLabel?.text = target.title
      cell.detailTextLabel?.text = target.desc
      
      return cell
   }
}
