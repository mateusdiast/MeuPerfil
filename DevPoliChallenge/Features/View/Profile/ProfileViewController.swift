//
//  ProfileViewController.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 11/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    let imagePicker = UIImagePickerController()
    let profileView = ProfileView()
    let profileViewModel = ProfileViewModel()
  
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        profileView.delegate = self
        profileViewModel.delegate = self
        setupNavigationBar()
    }
    
    func setupNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.setBackIndicatorImage(UIImage(named: "navigationImage"), transitionMaskImage: UIImage(named: "navigationImage"))
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handlePhoto()
       
    }
    
    override func loadView() {
        self.view = profileView
    }
    
    func sendImageToModel(_ info: [UIImagePickerController.InfoKey : Any]){
        if let image = info[.editedImage] as? UIImage{
            if let imageData = image.pngData(){
                profileViewModel.saveImage(data: imageData)
            }
        }
    }
    
    
    func handlePhoto(){
        profileView.headerContainer.setImage("profile.png")
    }
    
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.sendImageToModel(info)
        self.handlePhoto()
        self.dismiss(animated: true)
    }
}



extension ProfileViewController: ProfileViewDelegate{
    
    func sendWebSiteLabel() {
        print("testando func")
        guard let url = URL(string: URLWeb.webSite) else {return}
        UIApplication.shared.open(url)
    }
    
    func sendTappedTelephone(textContent: String) {
        print(textContent)
        profileViewModel.verifyTappedTelephone(textContent: textContent)
    }
    
    
    func logoutAction() {
        let alert = UIAlertController(title: "Gostaria de sair?", message: "Você tem certeza que quer sair!?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Sim!", style: UIAlertAction.Style.default, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Não!", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func setNextView(titleButton: String) {
        profileViewModel.verifyNextView(titleButton)
    }
    
    func gestureTapped() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        profileViewModel.verifyIfImageExist()
    }
}

extension ProfileViewController: ProfileViewModelDelegate {
    
    func makeACall(telephoneNumber: Int) {
        guard let number = URL(string: "telprompt://\(telephoneNumber)"),UIApplication.shared.canOpenURL(number) else {return}
        UIApplication.shared.open(number)
    }
    
    
    func goToBrowserView(_ url: String) {
        if let url = URL(string: url){
            UIApplication.shared.open(url)
        }
    }
    
    func goToNextView(_ vc: Any) {
        guard let vc = vc as? UIViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setImageDefault() {
        self.profileView.headerContainer.setImage("profile.png")
    }
    
    
    func alertimage() {
        let alert = UIAlertController(title: "Error", message: "Gostaria de editar ou excluir a image ?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Deletar", style: UIAlertAction.Style.default, handler: { action in
            self.profileViewModel.deleteImage()
        }))
        alert.addAction(UIAlertAction(title: "Alterar", style: UIAlertAction.Style.default, handler: { action in
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setImage() {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    
}


    

