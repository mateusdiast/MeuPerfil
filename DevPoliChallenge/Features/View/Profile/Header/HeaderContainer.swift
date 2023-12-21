//
//  ContainerHeader.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 11/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class HeaderContainer: UIView {
    
    
    lazy var imageProfile: UIImageView  = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "no-image")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 70
        image.layer.masksToBounds = true
        return image
    }()
    
    
    private lazy var buttonImage: UIButton = {
        let button = UIButton()
        button.backgroundColor = DesignSystem.Colors.primary
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 21
        if let image = UIImage(named: "ic-camera"){
            button.setImage(image, for: .normal)
        }
        return button
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = UserDefaults.getNameOfUser()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
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
        addSubview(imageProfile)
        addSubview(label)
        addSubview(buttonImage)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            imageProfile.topAnchor.constraint(equalTo: topAnchor),
            imageProfile.heightAnchor.constraint(equalToConstant: 140),
            imageProfile.widthAnchor.constraint(equalToConstant: 140),
            imageProfile.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            label.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 16),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonImage.heightAnchor.constraint(equalToConstant: 42),
            buttonImage.widthAnchor.constraint(equalToConstant: 42),
            buttonImage.topAnchor.constraint(equalTo: imageProfile.topAnchor, constant: 98),
            buttonImage.leadingAnchor.constraint(equalTo: imageProfile.leadingAnchor, constant: 98)
        ])
    }
    
    func setImage(_ fileName: String) {
        let fileURL = FileURL.fileURL
        do{
            let imageData = try Data(contentsOf:  fileURL)
            imageProfile.image = UIImage(data: imageData)
        }catch{
            print("Error loading image: \(error.localizedDescription)")
            imageProfile.image =  UIImage(named: "no-image")
        }
    }
}
