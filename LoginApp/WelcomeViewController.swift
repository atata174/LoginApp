//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by PenguinRaja on 03.02.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    var userNameLabel: String?
    
    @IBOutlet var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let login = userNameLabel else { return }
        welcomeLabel.text = "Hello, \(login)!\n 👋"
    }
}
