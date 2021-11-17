//
//  ViewController.swift
//  NewsApp
//
//  Created by Nikolay T on 15.11.2021.
//

import UIKit
//import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var array: [News]? {
        didSet {
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        APIManager.shared.fetchArticlesFromApi()
        
        //getInfo()
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        
        //cell.labelHead.text = array[indexPath.row].title
        
        return cell
    }
}

//extension ViewController {
//    private func getInfo(){
//        AF.request("https://newsapi.org/v2/top-headlines?country=us&from=2021-11-14&apiKey=7bb94fc0595647539e9fe359fef6496b", method: .get).responseJSON { responseData in
//            let result =  try! responseData.result.get()
//            print(result)
//
//
//        }
//    }
//}

