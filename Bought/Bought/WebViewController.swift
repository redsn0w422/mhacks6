import Foundation
import UIKit
import Firebase

class WebViewController: UIViewController {
    var myRootRef = Firebase(url:"https://bought.firebaseio.com")
    var url:String?
    var product : [AnyObject] = []
//    var product : [NSMutableDictionary] = []
    // Define UI elements
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var dollarAmountField: UITextField!
    
    @IBAction func addProductButton(sender: AnyObject) {
        product.append(dollarAmountField.text)
        myRootRef.childByAppendingPath("/products").setValue(product)
    }
    
    override func viewDidAppear(animated: Bool) {
        self.webView?.loadRequest(NSURLRequest(URL: NSURL(string: self.url!)!))
        product.append(self.url!)
    }
}