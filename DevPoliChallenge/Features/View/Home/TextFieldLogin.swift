//
//  TextFieldLogin.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 17/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class TextFieldLogin: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        textColor = .black
        attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "default", attributes: [NSAttributedString.Key.foregroundColor : DesignSystem.Colors.borderButton])
        layer.borderWidth = 1
        layer.cornerRadius = 12
        layer.borderColor = DesignSystem.Colors.borderButton.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: self.frame.height))
        leftViewMode = .always
    }
    


}
