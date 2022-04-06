//
//  SecondViewController.swift
//  CommentoutMobileApp
//
//  Created by Muhammed Selimhan gülsever on 3.04.2022.
//

import UIKit
import Lightbox


class SecondViewController: UIViewController {
    
    var ChoosenNews1 : NewViewModel!

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var content: UILabel!
    let theme = UIApplication.shared.windows.first
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Image.load(urlString: ChoosenNews1.NewHolder.mainImage.url)
        tittle.text = ChoosenNews1.tittle
        summary.text = ChoosenNews1.summary
        if theme?.overrideUserInterfaceStyle == .dark {
            content.text = ChoosenNews1.content.htmlToString
        }else {
            content.attributedText = ChoosenNews1.content.htmlToAttributedString
        }
        //image interaaction
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showLightbox))
            Image.isUserInteractionEnabled = true
            Image.addGestureRecognizer(tapGestureRecognizer)
        
    }
    // Share Button
    @IBAction func ShareClicked(_ sender: Any) {
        
        let text = ChoosenNews1.NewHolder.shareURL
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
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
}
