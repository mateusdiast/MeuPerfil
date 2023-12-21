//
//  TermOfUseViewController.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 15/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit
import WebKit

class TermOfUseViewController: UIViewController {
    
    let webViewCustom = WebViewCostum()

    override func viewDidLoad() {
        super.viewDidLoad()
        webViewCustom.webView.load(URLRequest(url: URLWeb.termsOfUse!))
        title = "Termos e uso"
    }
    
    override func loadView() {
        self.view = webViewCustom
    }
    

}
