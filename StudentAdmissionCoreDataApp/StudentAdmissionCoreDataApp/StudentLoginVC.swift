//
//  StudentLoginVC.swift
//  StudentAdmissionCoreDataApp
//
//  Created by Krishna Bhatt on 20/07/21.

import UIKit

class StudentLoginVC: UIViewController {
    
    private let usernameTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Username"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .gray
        return textfield
    }()
    
    private let passwordTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .gray
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private let mybutton:UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"S2.jpg")!)
        
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(mybutton)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameTextField.frame = CGRect(x: 40, y: 400, width:view.width - 80, height: 40)
        passwordTextField.frame = CGRect(x: 40, y: usernameTextField.bottom + 10, width: view.width - 80, height: 40)
        mybutton.frame = CGRect(x: 40, y: passwordTextField.bottom + 20, width: view.width - 80, height: 40)
    }
    
    @objc private func loginTapped()
    {
        if usernameTextField.text == "Student" && passwordTextField.text == "stud123"
        {
            UserDefaults.standard.set(usernameTextField.text!, forKey: "email")
            let vc = DetalisStudVC()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Alert!", message: "Email and Password didn't match", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
}
