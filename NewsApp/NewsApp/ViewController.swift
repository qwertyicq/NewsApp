//
//  ViewController.swift
//  NewsApp
//
//  Created by Nikolay T on 15.11.2021.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let loadDataOperation = BlockOperation {
        APIManager.shared.fetchArticlesFromApi()
    }
    
    let checkDataLoad = BlockOperation {
        while APIManager.dataArray?.articlesArray == nil {
            
        }
    }
    
    var array: [News] = [News]() {
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
        
        checkDataLoad.addDependency(loadDataOperation)
        
        DispatchQueue.global(qos: .background).async {
            self.loadDataOperation.start()
            self.checkDataLoad.start()
            
            guard let unwrDataArray = APIManager.dataArray?.articlesArray else { return }
            
            for item in unwrDataArray {
                self.array.append(item)
            }
        }
    }
    
}

// Делигаты UITableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        
        cell.titleLabel.text = array[indexPath.row].title
        cell.descriptionLabel.text = array[indexPath.row].description
        
        guard let unwrUrlImage = array[indexPath.row].urlToImage else { return cell }
        
        cell.imageNews.kf.setImage(with: URL(string: unwrUrlImage))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetailedNews", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let unwrRow = tableView.indexPathForSelectedRow?.row,
              let unwrIndexPathForRow = tableView.indexPathForSelectedRow else {
            return
        }
        
        if let destinationViewController = segue.destination as? DetailNewsViewController {
            
            destinationViewController.urlString = array[unwrRow].urlToNews
            
            tableView.deselectRow(at: unwrIndexPathForRow, animated: true)
            
        }
    }
}

