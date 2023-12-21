//
//  WebViewCostu,.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 16/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit
import WebKit

class WebViewCostum: UIView {

    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.load(URLRequest(url: URLWeb.termsOfUse!))
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView(){
        self.addSubview(webView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.topAnchor),
            webView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
