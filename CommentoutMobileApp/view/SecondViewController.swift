//
//  SecondViewController.swift
//  CommentoutMobileApp
//
//  Created by Muhammed Selimhan gülsever on 3.04.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    var secilenhaber2 : HaberViewModel!

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var content: UILabel!
    let theme = UIApplication.shared.windows.first
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Image.load(urlString: secilenhaber2.habertutucu.mainImage.url)
        tittle.text = secilenhaber2.tittle
        summary.text = secilenhaber2.summary
        if theme?.overrideUserInterfaceStyle == .dark {
            content.text = secilenhaber2.content.htmlToString
        }else {
            content.attributedText = secilenhaber2.content.htmlToAttributedString
        }
        
        
        /*ikinci bir yol olarak
        content.attributedText = secilenhaber2.content.htmlToAttributedString
         kullılarak direkt olarak html formatında yazdırılabilir */
        
        //image interaaction
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            Image.isUserInteractionEnabled = true
            Image.addGestureRecognizer(tapGestureRecognizer)
        
    }
    // paylaş butonu
    @IBAction func paylastiklandi(_ sender: Any) {
        
        let text = secilenhaber2.habertutucu.shareURL
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        self.present(activityViewController, animated: true, completion: nil)
    }
    //resme tıklayınca büyütme
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    //full ekrandan çıkış
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }

}
