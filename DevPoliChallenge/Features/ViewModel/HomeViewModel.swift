//
//  HomeViewModel.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 20/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject{
    func goNextView()
}

final class HomeViewModel{
    
    weak var delegate: HomeViewModelDelegate?
        
    func verifyNameOfUser(name: String){
        if name != "" {
            UserDefaults.setNameOfUser(value: name)
            delegate?.goNextView()
        }else{
            delegate?.goNextView()
        }
    }
}
