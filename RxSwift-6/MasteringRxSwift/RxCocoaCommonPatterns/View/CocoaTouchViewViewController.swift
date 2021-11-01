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

class CocoaTouchViewViewController: UIViewController {

    @IBOutlet weak var targetView: UIView!
    
    @IBAction func showView(_ sender: Any) {
        targetView.isHidden = false
    }
    
    @IBAction func hideView(_ sender: Any) {
        targetView.isHidden = true
    }
    
    @IBAction func setAlphaToZero(_ sender: Any) {
        targetView.alpha = 0.0
    }
    
    @IBAction func setAlphaToZeroPointFive(_ sender: Any) {
        targetView.alpha = 0.5
    }
    
    @IBAction func setAlphaToOne(_ sender: Any) {
        targetView.alpha = 1.0
    }
    
    @IBAction func setBackgroundColorToRed(_ sender: Any) {
        targetView.backgroundColor = .systemRed
    }
    
    @IBAction func setBackgroundColorToGreen(_ sender: Any) {
        targetView.backgroundColor = .systemGreen
    }
    
    @IBAction func setBackgroundColorToBlue(_ sender: Any) {
        targetView.backgroundColor = .systemBlue
    }
    
    @IBAction func enableUserInteraction(_ sender: Any) {
        targetView.isUserInteractionEnabled = true
    }
    
    @IBAction func disableUserInteraction(_ sender: Any) {
        targetView.isUserInteractionEnabled = false
    }
}
