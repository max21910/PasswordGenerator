//
//  funcPassgen.swift
//  PasswordGenerator
//
//  Created by Max  on 15/10/2022.
//
import Foundation

//with number and other

func randomPassword(pwdLength: Int) -> String {
    let pwdLetters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%&0123456789=+"
    var passWord = ""
    for _ in 0 ..< pwdLength {
        passWord.append(pwdLetters.randomElement()!)
    }
    return passWord
}

//witout number
func randomPasswordL(pwdLength: Int) -> String {
    let pwdLetters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var passWordL = ""
    for _ in 0 ..< pwdLength {
        passWordL.append(pwdLetters.randomElement()!)
    }
    return passWordL
}
//just with number
func randomPasswordN(pwdLength: Int) -> String {
    let pwdLetters = "123456789"
    var passWordN = ""
    for _ in 0 ..< pwdLength {
        passWordN.append(pwdLetters.randomElement()!)
    }
    return passWordN
}
