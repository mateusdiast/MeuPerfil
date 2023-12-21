//
//  buttonMenuView.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 11/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class ButtonMenuView: UIButton {
//    
//    let profileView = ProfileView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        setTitleColor(.white, for: .normal)
        backgroundColor =  DesignSystem.Colors.background
        setTitleColor(DesignSystem.Colors.tertiary, for: .normal)
        layer.borderWidth = 1
        layer.borderColor = DesignSystem.Colors.borderButton.cgColor
        titleLabel?.font = UIFont.systemFont(ofSize: 18)
        contentHorizontalAlignment = .left
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setTitle(_ title: String){
        setTitle(title, for: .normal)
    }

    
//    @objc func setAction(_ func: String){
//        
//  }

}
 
