//
//  FooterView.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 12/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class FooterContainer: UIView {

    private lazy var labelService: UILabel = {
        let label = UILabel()
        label.text = "Atendimento"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelContactOne: UILabel = {
        let label = UILabel()
        let text = "3003-1234\n(Capitais e regiões metropolitanas)"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = DesignSystem.Colors.accent
        label.attributedText = text.setAtribbuteText(location: 9, length: 36, color: DesignSystem.Colors.numberColor, sizeFont: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelContactTwo: UILabel = {
        let label = UILabel()
        let text = "0800 123 4567\n(Demais localidades)"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = DesignSystem.Colors.accent
        label.attributedText = text.setAtribbuteText(location: 13, length: 21, color: DesignSystem.Colors.numberColor, sizeFont: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelContactThree: UILabel = {
        let label = UILabel()
        let text = "devpoli.com\n Versão \(Bundle.main.appVersion) (\(Bundle.main.buildVersion))"
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = DesignSystem.Colors.secondary
        label.attributedText = text.setAtribbuteText(location: 11, length: 20, color: UIColor.black, sizeFont: 12)
        label.textAlignment = .center
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
        backgroundColor = DesignSystem.Colors.background
        addSubview(labelService)
        addSubview(labelContactOne)
        addSubview(labelContactTwo)
        addSubview(labelContactThree)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            labelService.topAnchor.constraint(equalTo: topAnchor, constant: 23),
            labelService.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            
            labelContactOne.topAnchor.constraint(equalTo: labelService.bottomAnchor, constant: 9),
            labelContactOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            
            labelContactTwo.topAnchor.constraint(equalTo: labelContactOne.bottomAnchor, constant: 8),
            labelContactTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            
            labelContactThree.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -31),
            labelContactThree.centerXAnchor.constraint(equalTo: centerXAnchor)


        ])
    }

}
