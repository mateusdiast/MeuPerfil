//
//  FaqViewController.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 16/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class FaqViewController: UIViewController {
    
    let webViewCustom = WebViewCostum()

    override func viewDidLoad() {
        super.viewDidLoad()
        webViewCustom.webView.load(URLRequest(url: URLWeb.faq!))
        title = "Dúvidas frequentes"
    }
    
    override func loadView() {
        self.view = webViewCustom
    }

}
