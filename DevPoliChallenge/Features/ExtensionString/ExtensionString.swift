//
//  ExtensionString.swift
//  DevPoliChallenge-MeuPerfil
//
//  Created by mateusdias on 12/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit


extension String {
    func setAtribbuteText(location: Int, length: Int, color: Any, sizeFont: Int) -> NSAttributedString {
           let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(.font, value: UIFont.systemFont(ofSize: CGFloat(sizeFont)), range: NSRange(location: location, length: length))
        attributeString.addAttribute(.foregroundColor, value: color, range: NSRange(location: location, length: length))
           return attributeString
       }
}

