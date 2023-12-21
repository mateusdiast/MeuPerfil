//
//  Home.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 11/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func verifyData(name: String)
}

final class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
        nameField,
        passwordField,
        button
        ])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var labelSignUp: UILabel = {
        let label = UILabel()
        let text = "Não tem conta? Cadastre-se!"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.attributedText =  text.setAtribbuteText(location: 15, length: 12, color: DesignSystem.Colors.primary, sizeFont: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        let text = "MeuPerfil"
        label.textColor = DesignSystem.Colors.primary
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.attributedText = text.setAtribbuteText(location: 3, length: 6, color: UIColor(.black), sizeFont: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameField: TextFieldLogin = {
        let textField = TextFieldLogin()
        textField.placeholder  = "Nome de Usuario"
        return textField
    }()
    
    private lazy var passwordField: TextFieldLogin = {
        let textField = TextFieldLogin()
        textField.placeholder  = "Senha"
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("ENTRAR", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = DesignSystem.Colors.primary
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.addSubview(labelTitle)
        self.addSubview(stackView)
        self.addSubview(labelSignUp)
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            labelTitle.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -100),
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 215),
       
            
            labelSignUp.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            labelSignUp.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            labelSignUp.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
    }
    
    @objc private func buttonClicked(){
        guard let name = nameField.text else {return}
        delegate?.verifyData(name: name)
    }
    
}
