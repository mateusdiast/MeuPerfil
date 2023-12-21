//
//  ExtensionBundle.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 17/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation


extension Bundle {
    
    var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "O numero do build não está disponível"
    }
    
    var buildVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return version
        }
        return "Não foi verificar o número de build do app"
    }

}
