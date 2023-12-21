//
//  MenuView.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 11/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class MenuOneView: UIView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleContainer,
            buttonOne,
            buttonTwo,
            buttonThree
        ])
        stackView.axis = .vertical
        stackView.distribution = .fill

        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var buttonOne: ButtonMenuView = {
        let button = ButtonMenuView()
        button.setTitle("Dados pessoais")
        return button
    }()
    
    lazy var buttonTwo: ButtonMenuView = {
        let button = ButtonMenuView()
        button.setTitle("Endereços")
        return button
    }()
    
    lazy var buttonThree: ButtonMenuView = {
        let button = ButtonMenuView()
        button.setTitle("Cartões")
        return button
    }()
    
    private lazy var titleContainer: UIView = {
        let view = UIView()
        view.addSubview(titleLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = DesignSystem.Colors.background
        return view
    }()
    
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "MINHA CONTA"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = DesignSystem.Colors.primary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        self.addSubview(stackView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 245),
            
            titleContainer.heightAnchor.constraint(equalToConstant: 35),
            titleContainer.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            titleContainer.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            titleContainer.topAnchor.constraint(equalTo: stackView.topAnchor),
            
            titleLabel.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 22)
            
        ])
     
    }
   
    
}
