//
//  DetailNewsViewController.swift
//  NewsApp
//
//  Created by Nikolay T on 17.11.2021.
//

import UIKit
import WebKit

class DetailNewsViewController: UIViewController {
    
    @IBOutlet weak var webBrowser: WKWebView!
    public var urlString: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let url = URL(string: urlString!) else { return }
        
        webBrowser.load(URLRequest(url: url))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
