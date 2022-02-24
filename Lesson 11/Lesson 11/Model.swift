//
//  Model.swift
//  Lesson 11
//
//  Created by Владимир Воробьев on 16.02.2022.
//

import Foundation

    
public enum Checkresults: String{
        case logFault = "Check your Logon"
        case passFault = "Check your Password"
        case seccess = "Congratulations"
    }
    
let logAlphabet = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM.@_-"
let passAlphabet = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"
    
  //ПРовека логина и пароля
public func idetitiesCheck (_ login: String, _ password: String) -> Checkresults {
        if checkLogin(login){
            return .logFault
        } else if checkPassword(password) {
            return .passFault
        } else {
            return .seccess
        }
    }
 //Проверка логина
func checkLogin (_ login: String) -> Bool {
        //проверка на "ненужные" символы в строке
        guard !checkAlphabet(logAlphabet, login) else {return true}
     //проверка наличия и позиции @
        var signPos = signPosition(login, "@")
        guard (signPos.count == 1) &&   //всего 1 штука
                (1 < signPos[0]) &&     //не раньше второго знака
                (signPos[0] < (login.count - 3))  else {return true} //не дальше 4-го с конца
        //проверка наличия и позиции .
        signPos = signPosition(login, Character("."))
        guard (signPos.count >= 1) && //не менее одной точки
                (signPos.last ?? signPos[0] > (login.count - 5)) else {return true}//д. б. в конце

        return false
    }
//ПРоверка пароля
func checkPassword (_ password: String) -> Bool {
        //проверка на "ненужные" символы в строке
        guard !checkAlphabet(passAlphabet, password) else {return true}
        //проверка наличия цифр и обоих регистров
        guard !oneSignInWorldPresence(password, "1234567890") else {return true}
        guard !oneSignInWorldPresence(password, "abcdefghigklmnopqrstuvwxyz") else {return true}
        guard !oneSignInWorldPresence(password, "ABCDEFGHIGKLMNOPQRSTUVWXYZ") else {return true}
        return false
    }
    
    //проверка принадлежности всех символов Алфавиту Принадлежит - 0 не принадл - 1
func checkAlphabet (_ alphabet: String, _ tested: String) -> Bool {
        for i in tested {
            if !alphabet.contains(i) {return true}
        }
        return false
    }
//Количество данного знака в строке
func signPresence (_ signTested: Character, _ worldTested: String) -> Int {
        var count = 0
        for ch in worldTested {
            if ch == signTested{
                count += 1
            }
        }
        return count
    }
//проверка наличия хотя бы одного совпадающего знака  в двух словах да - 0 нет - 1
func oneSignInWorldPresence (_ worldTested: String, _ signsToPresence: String) -> Bool {
    for char in worldTested {
        if signsToPresence.contains(char) {return false}
    }
    return true
}
//Позииция символа в троке в Int
func signPosition (_ worldTested: String, _ signTested: Character) -> [Int] {
    var positions: [Int] = []
    var i = 1
    for sign in worldTested {
        if sign == signTested {
            positions.append(i)
        }
        i += 1
    }
    return positions
}
