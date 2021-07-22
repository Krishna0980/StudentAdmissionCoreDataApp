//
//  ViewController.swift
//  StudentAdmissionCoreDataApp
//
//  Created by Krishna Bhatt on 20/07/21.

import UIKit

class ViewController: UIViewController {

    private let mybuttonAdmin:UIButton = {
        let button = UIButton()
        button.setTitle("Admin Login", for: .normal)
        button.addTarget(self, action: #selector(AdminloginTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let mybuttonStud:UIButton = {
        let button = UIButton()
        button.setTitle("Student Login", for: .normal)
        button.addTarget(self, action: #selector(StudloginTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc private func AdminloginTapped()
    {
        let vc = AdminLoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func StudloginTapped()
    {
        let vc = StudentLoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"S2.jpg")!)
        title = "Student Management System"
        view.addSubview(mybuttonAdmin)
        view.addSubview(mybuttonStud)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mybuttonAdmin.frame = CGRect(x: 40, y: 450, width: view.width - 80, height: 50)
        mybuttonStud.frame = CGRect(x: 40, y: mybuttonAdmin.bottom + 20, width: view.width - 80, height: 50)
    }


}

