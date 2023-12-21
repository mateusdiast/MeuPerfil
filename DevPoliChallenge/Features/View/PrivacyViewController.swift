//
//  PrivacyViewController.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 16/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class PrivacyViewController: UIViewController {
    
    let webViewCustom = WebViewCostum()

    override func viewDidLoad() {
        super.viewDidLoad()
        webViewCustom.webView.load(URLRequest(url: URLWeb.privacyPolicy!))
        title = "Política de privacidade"
    }
    
    override func loadView() {
        self.view = webViewCustom
    }
    

}
