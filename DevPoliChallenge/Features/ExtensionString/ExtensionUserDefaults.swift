//
//  ExtensionUserDefaults.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 20/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    enum Keys: String {
        case nameOfUser
    }
        
    static func setNameOfUser(value: String){
        UserDefaults.standard.set(value, forKey: Keys.nameOfUser.rawValue)
    }
        
    static func getNameOfUser() -> String {
        UserDefaults.standard.string(forKey: Keys.nameOfUser.rawValue) ?? "Anynomous"
    }
        
}
