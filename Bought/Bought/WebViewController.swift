import Foundation
import UIKit
import Firebase

class WebViewController: UIViewController {
    var myRootRef = Firebase(url:"https://bought.firebaseio.com")
    var url:String?
    var product : [AnyObject] = []
    // Define UI elements
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var dollarAmountField: UITextField!
    
    @IBAction func addProductButton(sender: AnyObject) {
        product.append(dollarAmountField.text)
        myRootRef.childByAppendingPath("/products").setValue(product)
        var alert = UIAlertController(title: "Success!", message: "Product successfully added to watchlist", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        performSegueWithIdentifier("showProductPage", sender: self)
    }
    
    override func viewDidAppear(animated: Bool) {
        self.webView?.loadRequest(NSURLRequest(URL: NSURL(string: self.url!)!))
        product.append(self.url!)
    }
}