//
//  DetailsVC.swift
//  Project16_CapitalCities
//
//  Created by Oğulcan Aşa on 27.06.2023.
//

import UIKit
import WebKit

class DetailsVC: UIViewController, WKNavigationDelegate {
    @IBOutlet var webView: WKWebView!
    var chosenCity: String?

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        guard let actionTitle = action.title else { return }
        guard let url = URL(string: "https://en.wikipedia.org/wiki/\(chosenCity ?? "London")") else { return }
        webView.load(URLRequest(url: url))
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
