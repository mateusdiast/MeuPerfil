//
//  ProfileViewModel.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 14/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol ProfileViewModelDelegate: AnyObject {
    func alertimage()
    func setImage()
    func setImageDefault()
    func goToNextView(_ vc: Any)
    func makeACall(telephoneNumber: Int)
}

class ProfileViewModel{
    
    weak var delegate: ProfileViewModelDelegate?
    
    func verifyIfImageExist(){
    
        let path = FileURL.fileURL.path
        
        if  FileManager.default.fileExists(atPath: path){
            delegate?.alertimage()
        }else{
            delegate?.setImage()
        }
    }
    
    
    func saveImage(data: Data){
        let url = FileURL.fileURL
        do {
            try data.write(to: url)
            print(url)
            print("Image saved successfully")
        }catch{
            print("Unable to Write Data to Disk (\(error))")
        }
    }
    
    func deleteImage(){
        do{
            try FileManager.default.removeItem(at: FileURL.fileURL)
            delegate?.setImageDefault()
            
        }catch{
            print("error na hora de deletar")
        }
    }
    
    func verifyNextView(_ titleButton: String){
        let views = ViewCasesModels(rawValue: titleButton)
        
        switch views {
        case .personalDataView:
            let vc = PersonalDataViewController()
            delegate?.goToNextView(vc)
        case .adressView:
            let vc = AdressViewController()
            delegate?.goToNextView(vc)
        case .cardView:
            let vc = CardViewController()
            delegate?.goToNextView(vc)
        case .myRequestsView:
            let vc = MyRequestsViewController()
            delegate?.goToNextView(vc)
        case .extractView:
            let vc = ExtractViewController()
            delegate?.goToNextView(vc)
        case .termsOfUseView:
            let vc = TermOfUseViewController()
            delegate?.goToNextView(vc)
        case .privacyPolicyView:
            let vc = PrivacyViewController()
            delegate?.goToNextView(vc)
        case .faqView:
            let vc = FaqViewController()
            delegate?.goToNextView(vc)
        case .none:
            break
        }
    }
    
    
    func verifyTappedTelephone(textContent: String){
        let telephoneModel = TelephoneModel(rawValue: textContent)
            
        switch telephoneModel {
        case .telephoneCapitals:
            print("make a call")
            let number = 30031234
            delegate?.makeACall(telephoneNumber: number)
        case .telephoneAnotherPlaces:
            print("make a another places")
            let number = 08001234567
            delegate?.makeACall(telephoneNumber: number)
        default:
            break
        }
    }
}
