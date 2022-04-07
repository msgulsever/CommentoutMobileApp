//
//  SecondViewController.swift
//  CommentoutMobileApp
//
//  Created by Muhammed Selimhan gülsever on 3.04.2022.
//

import UIKit
import Lightbox
import WebKit

class NewsViewModel: UIViewController, WKNavigationDelegate {
    
    var ChoosenNews1 : NewViewModel!

   
    @IBOutlet weak var WebKit: WKWebView!
    @IBOutlet weak var SummaryLabel: UILabel!
    @IBOutlet weak var Tittlelabel: UILabel!
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var WebKitHeight: NSLayoutConstraint!
    let theme = UIApplication.shared.windows.first
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Darkmode for Webkit
        let lightDarkCSS = ":root { color-scheme: light dark; }"
        let base64 = lightDarkCSS.data(using: .utf8)!.base64EncodedString()
        let script = """
            javascript:(function() {
                var parent = document.getElementsByTagName('head').item(0);
                var style = document.createElement('style');
                style.type = 'text/css';
                style.innerHTML = window.atob('\(base64)');
                parent.appendChild(style);
            })()
        """
        let cssScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        WebKit.configuration.userContentController.addUserScript(cssScript)
        
        Image.load(urlString: ChoosenNews1.NewHolder.mainImage.url)
        Tittlelabel.text = ChoosenNews1.tittle
        SummaryLabel.text = ChoosenNews1.summary
        WebKit.loadHTMLString(ChoosenNews1.content, baseURL: nil)
        
        if theme?.overrideUserInterfaceStyle == .dark {
            WebKit.overrideUserInterfaceStyle = .dark
            
        }else {
            WebKit.overrideUserInterfaceStyle = .light
        }
        //image interaaction
        self.WebKit.scrollView.isScrollEnabled = false
        self.WebKit.navigationDelegate = self
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showLightbox))
            Image.isUserInteractionEnabled = true
            Image.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    
    @IBAction func ShareClick(_ sender: Any) {
        let text = ChoosenNews1.NewHolder.shareURL
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare as [Any], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    //Full Screen Image
    
    @objc func showLightbox() {
            let images = [
                LightboxImage(imageURL: URL(string: ChoosenNews1.NewHolder.mainImage.url)!)]
            let controller = LightboxController(images: images)
            controller.dynamicBackground = true
            present(controller, animated: true, completion: nil)
        }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let js = "document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust='200%'"//dual size
            webView.evaluateJavaScript(js, completionHandler: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.WebKitHeight.constant = webView.scrollView.contentSize.height
            
        }
    }
    
   
}
