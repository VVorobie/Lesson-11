//
//  Lesson_11Tests.swift
//  Lesson 11Tests
//
//  Created by Владимир Воробьев on 16.02.2022.
//

import XCTest
@testable import Lesson_11

class Lesson_11Tests: XCTestCase {
    let goodLogin = "Sv.ke_ki@dkrjf.com"
    let goodPassword = "ERdfk0k2U"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //Проверка прохождения правильных логина и пароля

    func testgoodIdentitiesCheck () {
       
        XCTAssertEqual(idetitiesCheck(goodLogin, goodPassword), Checkresults.seccess, "Не проходят нормальные логин и пароль")
    }
   
    //Проверка отсутствия в логине запрещённых символов
    func testLoginAlphabet () {
        //дано
        let testedLogin = "Sv.k#e_ki@dkrjf.com"
        //Что делаем
        let result = idetitiesCheck(testedLogin, goodPassword)
        //что дложно получиться
        XCTAssertEqual(result, Checkresults.logFault, "Проверка логина пропускает запрещённые символы")
    }
    
    //проверка наличия в логине одной @  её правильная позиция (не первая и не в конце)
    func testLoginDogPresenceAndPosiion () {
        //дано
        var testedLogon = "Sv.ke_kidkrjf.com"

        //что делаем
       var result = checkLogin(testedLogon)
        
        //что должно получиться
        XCTAssertEqual(result, true, "Проверка логина пропускает отсутствие @")
        
        //дано
        testedLogon = "Sv.@ke_ki@dkrjf.com"

        //что делаем
       result = checkLogin(testedLogon)
        
        //что должно получиться
        XCTAssertEqual(result, true, "Проверка логина пропускает больше одной @")
        
        //дано
        testedLogon = "@Sv.ke_kidkrjf.com"

        //что делаем
       result = checkLogin(testedLogon)
        
        //что должно получиться
        XCTAssertEqual(result, true, "Проверка логина пропускает @ на первой позиции")
       
        //дано
        testedLogon = "Sv.ke_kidkrj.@com"

        //что делаем
       result = checkLogin(testedLogon)
        
        //что должно получиться
        XCTAssertEqual(result, true, "Проверка логина пропускает @ на последних 4 позициях")
    }
    
    //проверка наличия точки и её наличие в последних 5 символах
    func testLoginPointPresenceAndPosiion (){
        //дано
        var testedLogin = "Sv.ke_ki@dkrjfcom"
        //что должно получиться
        XCTAssertEqual(checkLogin(testedLogin), true, "Проверка логина пропускает отсутствие точки")
        
        //дано
        testedLogin = "Sv.ke_ki@dkr.jfcom"
        //что должно получиться
        XCTAssertEqual(checkLogin(testedLogin), true, "Проверка логина пропускает отсутствие точки в конце")
    }
    
    //Проверка отсутствия в пароле запрещённых символов
    func testPassAlphabet () {
        //дано
        let testedPass = "ERd+fk0k2U"
        //Что делаем
        let result = idetitiesCheck(goodLogin, testedPass)
        //что дложно получиться
        XCTAssertEqual(result, Checkresults.passFault, "Проверка пароля пропускает запрещённые символы")
    }
    
    //проверка наличия в пароле верхнего регистра, нижнего, цифры
    
    func testPassSimbolsPresence () {
        //дано
        var testedPas = "erdfk0k2u"
        //что дложно получиться
        XCTAssertEqual(checkPassword(testedPas), true, "Проверка пароля пропускает отсутствие заглавных букв")
        
        //дано
        testedPas = "ERDFK0K2U"
        //что дложно получиться
        XCTAssertEqual(checkPassword(testedPas), true, "Проверка пароля пропускает отсутствие прописных букв")
        
        //дано
        testedPas = "ERdfkkU"
        //что дложно получиться
        XCTAssertEqual(checkPassword(testedPas), true, "Проверка пароля пропускает отсутствие цифр")
    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
