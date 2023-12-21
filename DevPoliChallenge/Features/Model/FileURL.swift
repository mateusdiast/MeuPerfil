//
//  PathUrl.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 14/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation


struct FileURL {
    static let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("profile.png")
}
