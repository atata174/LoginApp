//
//  LoginViewController.swift
//  LoginApp
//
//  Created by PenguinRaja on 03.02.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let login = "Oleg"
    private let password = "oleg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        logInLogic()
    }
    
    @IBAction func forgotNameAction(_ sender: UIButton) {
        showAlert(title: "Oops!", message: "Your name is \(login)🤔")
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        showAlert(title: "Oops!", message: "Your password is \(password)🤔")
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userNameLabel = userNameTextField.text
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Login logic
    
    private func logInLogic() {
        if userNameTextField.text == login && passwordTextField.text == password {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
        }
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

// MARK: - TextField Delegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let nextTag = textField.tag + 1
        
        if let nextResponder = userNameTextField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            logInLogic()
        }
        return true
    }
}
