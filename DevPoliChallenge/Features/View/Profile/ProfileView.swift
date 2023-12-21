//
//  ProfileView.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 11/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol ProfileViewDelegate: AnyObject {
    func gestureTapped()
    func setNextView(titleButton: String)
    func logoutAction()
    func sendTappedTelephone(textContent: String)
    func sendWebSiteLabel()
}

final class ProfileView: UIView {
    
    weak var delegate: ProfileViewDelegate?

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            headerContainer,
            menuOne,
            menuTwo,
            menuThree,
            buttonLogout,
            footerContainer
        ])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = . fill
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var footerContainer: FooterContainer = {
        let view = FooterContainer()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var headerContainer: HeaderContainer = {
        let view = HeaderContainer()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var menuOne: MenuOneView = {
        let menuView = MenuOneView()
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.buttonOne.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        menuView.buttonTwo.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        menuView.buttonThree.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        return menuView
    }()
    
    private lazy var menuTwo: MenuTwoView = {
        let menuView = MenuTwoView()
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.buttonOne.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        menuView.buttonTwo.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        return menuView
    }()
    
    private lazy var menuThree: MenuThreeView = {
        let menuView = MenuThreeView()
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.buttonOne.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        menuView.buttonTwo.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        menuView.buttonThree.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        return menuView
    }()
    
    private var buttonLogout: UIButton = {
        let button = UIButton()
        button.setTitle("Encerrar sessão", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = DesignSystem.Colors.logoutButton
        button.addTarget(self, action: #selector(buttonLogoutTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    @objc private func buttonLogoutTapped(){
        delegate?.logoutAction()
    }
    
    @objc private func tappedTelephoneCapitals(){
        guard let textContent = footerContainer.labelContactOne.text else {return}
        delegate?.sendTappedTelephone(textContent: textContent)
    }
    
    @objc private func tappedTelephoneAnotherPlaces(){
        guard let textContent = footerContainer.labelContactTwo.text else {return}
        delegate?.sendTappedTelephone(textContent: textContent)
    }
    
    @objc private func tappedWebsiteLabel(){
        delegate?.sendWebSiteLabel()
    }
    
    private func gestureWebSiteLabel(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedWebsiteLabel))
        footerContainer.labelContactThree.addGestureRecognizer(gesture)
        footerContainer.labelContactThree.isUserInteractionEnabled = true
    }
    
    
    private func gestureTelephoneCapitals(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedTelephoneCapitals))
        footerContainer.labelContactOne.addGestureRecognizer(gesture)
        footerContainer.labelContactOne.isUserInteractionEnabled = true
    }
    
    private func gestureTelephoneAnotherPlaces(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedTelephoneAnotherPlaces))
        footerContainer.labelContactTwo.addGestureRecognizer(gesture)
        footerContainer.labelContactTwo.isUserInteractionEnabled = true
    }
    
    private func gestureImageProfile(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectedImage))
        headerContainer.imageProfile.addGestureRecognizer(gesture)
        headerContainer.imageProfile.isUserInteractionEnabled = true
    }
    
    @objc private func menuButtonAction(_ sender: UIButton){
        delegate?.setNextView(titleButton: sender.currentTitle!)
    }
    
    
    @objc private func selectedImage(){
        delegate?.gestureTapped()
    }
    
    
    private func setupView(){
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = DesignSystem.Colors.background
        setupView()
        setupConstraints()
        gestureImageProfile()
        gestureTelephoneCapitals()
        gestureTelephoneAnotherPlaces()
        gestureWebSiteLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            headerContainer.topAnchor.constraint(equalTo: stackView.topAnchor),
            headerContainer.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            headerContainer.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            headerContainer.heightAnchor.constraint(equalToConstant: 231),
            
            menuOne.topAnchor.constraint(equalTo: headerContainer.bottomAnchor),
            menuOne.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            menuOne.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            menuOne.heightAnchor.constraint(equalToConstant: 245),
            
            menuTwo.topAnchor.constraint(equalTo: menuTwo.bottomAnchor),
            menuTwo.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            menuTwo.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            menuTwo.heightAnchor.constraint(equalToConstant: 175),
            
            menuThree.topAnchor.constraint(equalTo: menuThree.bottomAnchor),
            menuThree.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            menuThree.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            menuThree.heightAnchor.constraint(equalToConstant: 245),
            
            buttonLogout.topAnchor.constraint(equalTo: menuThree.bottomAnchor),
            buttonLogout.leadingAnchor.constraint(equalTo: buttonLogout.leadingAnchor),
            buttonLogout.trailingAnchor.constraint(equalTo: buttonLogout.trailingAnchor),
            buttonLogout.heightAnchor.constraint(equalToConstant: 70),
            
            footerContainer.topAnchor.constraint(equalTo: buttonLogout.bottomAnchor),
            footerContainer.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            footerContainer.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            footerContainer.heightAnchor.constraint(equalToConstant: 210)
            
            
        ])
    }
}
