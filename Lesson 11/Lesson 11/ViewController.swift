//
//  ViewController.swift
//  Lesson 11
//
//  Created by Владимир Воробьев on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var loginField = false
    var passwordFilled = false
    
    var loginText = ""
    var passText = ""
      
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func loginActionText(_ sender: Any) {
        if let text = loginTextField.text {
            loginText = text
            if loginText.count > 5 {
                loginField = true
            }
        }
        if loginField && passwordFilled {
            inputButton.isEnabled = true
            inputButton.backgroundColor = .yellow
        }
    }

   
    @IBAction func passActionText(_ sender: Any) {

        if let text = passTextField.text {
            if passText.count < text.count{
                if let lastChar = text.last {
                passText.append(lastChar)
                passTextField.text?.removeLast()
                passTextField.text?.append("*")
                }
            }else if passText.count > text.count{
                passText.removeLast()
            }
            if text.count > 5 {
                passwordFilled = true
            }
        }
        if loginField && passwordFilled {
            inputButton.isEnabled = true
            inputButton.backgroundColor = .yellow
        }
    }
    
    @IBAction func inputActionButton(_ sender: UIButton) {

            switch idetitiesCheck(loginText, passText) {
            case .logFault:
                errorLabel.text = Checkresults.logFault.rawValue
                errorLabel.isHidden = false
            case .passFault:
                errorLabel.text = Checkresults.passFault.rawValue
                errorLabel.isHidden = false
            default:
                errorLabel.text = Checkresults.seccess.rawValue
                errorLabel.isHidden = false
            }
            
        loginTextField.text = nil
        passTextField.text = nil
        loginText = ""
        passText = ""
        loginField = false
        passwordFilled = false
        inputButton.isEnabled = false
    
    }
    
}

