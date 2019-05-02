//
//  ViewController.swift
//  RequestApiDecoder
//
//  Created by Vu on 5/2/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var urlFromTableView: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: urlFromTableView!) {
            webView.load(URLRequest(url: url))
        }

        // Do any additional setup after loading the view.
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
