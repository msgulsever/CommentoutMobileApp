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
    
    private var HaberListViewModel : haberListViewModel!
    var secilenhaber : HaberViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
       getData()
        
    }
    func getData() {
        let url = URL(string: "http://www.mocky.io/v2/59cc13f726000062106b773d")!
        Webservice().downloadinfos(url: url) { (list) in
            if let list = list {
                
                self.HaberListViewModel = haberListViewModel(haberlisttutucu: list)
                
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
                
            
            }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.HaberListViewModel == nil ? 0 : self.HaberListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let haberListModel = self.HaberListViewModel.haberAtIndex(indexPath.row)
        cell.baslik.text = haberListModel.tittle
        cell.Images.load(urlString: haberListModel.habertutucu.mainImage.url)

        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenhaber = self.HaberListViewModel.secilenhaber(indexPath.row)
                self.performSegue(withIdentifier: "gec", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "gec" {
                let destinationVC = segue.destination as! SecondViewController
                destinationVC.secilenhaber2 = secilenhaber
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

