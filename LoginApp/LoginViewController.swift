//
//  LoginViewController.swift
//  LoginApp
//
//  Created by PenguinRaja on 03.02.2021.
//

import UIKit

class LoginViewController: UIViewController {

//MARK: - Outlets
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

// MARK: - Properties
    
    private let login = "Oleg"
    private let password = "oleg"
    
// MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            welcomeVC.userNameLabel = login
        }
        
        @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
            userNameTextField.text = ""
            passwordTextField.text = ""
        }
        
// MARK: - Actions
    
    @IBAction func loginButtonAction() {
        if userNameTextField.text == login && passwordTextField.text == password {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
        }
    }
    
    @IBAction func forgotNameAction() {
        showAlert(title: "Oops!", message: "Your name is \(login)🤔")
    }
    
    @IBAction func forgotPasswordAction() {
        showAlert(title: "Oops!", message: "Your password is \(password)🤔")
    }
    

// MARK: - Alert Controller
    
    private func showAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - TextField Delegate and Work with keyboard

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonAction()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
