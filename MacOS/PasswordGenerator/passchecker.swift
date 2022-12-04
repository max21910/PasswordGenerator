//
//  passchecker.swift
//  PasswordGenerator
//
//  Created by Max  on 16/10/2022.
//

import Foundation
func passchecker() {
    
    if value < 10 {
        self.textToUpdate = "Is weak 🔴"
        
    }
    if value > 15 {
        self.textToUpdate = "Is ok 🟠"
    }
    if value > 20 {
        self.textToUpdate = "Very good 🟢"
    }
}
