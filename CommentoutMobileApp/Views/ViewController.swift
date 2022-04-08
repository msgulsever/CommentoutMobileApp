//
//  ViewController.swift
//  CommentoutMobileApp
//
//  Created by Muhammed Selimhan gülsever on 2.04.2022.
//

import UIKit
import WebKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var HaberListViewModel : NewsListViewModel!
    var ChoosenNew : NewViewModel?
    var WebService = WebServiceWithAlamofire()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        WebService.vc = self
        WebService.GetAllDataAF()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.WebService.Holder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let NewsListModel = self.WebService.Holder[indexPath.row]
        cell.baslik.text = NewsListModel.title
        cell.Images.load(urlString: NewsListModel.mainImage.url)

        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.HaberListViewModel = NewsListViewModel(NewListHolder: WebService.Holder)
        ChoosenNew = HaberListViewModel.ChoosenNew(indexPath.row)
                self.performSegue(withIdentifier: "gec", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "gec" {
                let destinationVC = segue.destination as! NewsViewModel
                destinationVC.ChoosenNews1 = ChoosenNew
            }
        }
    
    @IBAction func theme(_ sender: UISwitch) {
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.windows.first
            
            if sender.isOn {
                appDelegate?.overrideUserInterfaceStyle = .dark
                sender.thumbTintColor = .white
                sender.onTintColor = .darkGray
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
            sender.thumbTintColor = .black
            sender.onTintColor = .darkGray
            return
            
        }
    }
}

