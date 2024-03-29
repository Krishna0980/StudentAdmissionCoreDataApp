//
//  CUstudVC.swift
//  StudentAdmissionCoreDataApp
//
//  Created by Krishna Bhatt on 20/07/21.


import UIKit

class CUstudVC: UIViewController {
    

    var stud:Student?
    
    private let nameTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Name"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .systemTeal
        return textfield
    }()
    
    private let ageTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Age"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .systemTeal
        return textfield
    }()
    
    private let classTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Class"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .systemTeal
        return textfield
    }()
    
    
    
    private let SaveButton:UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(SaveButtonTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(ageTextField)
        view.addSubview(classTextField)
        view.addSubview(SaveButton)
        
        if let student = stud{
            nameTextField.text = student.name
            ageTextField.text = String(student.age)
            classTextField.text = student.classes
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        nameTextField.frame = CGRect(x: 30, y: 200, width:view.width - 80, height: 40)
        ageTextField.frame = CGRect(x: 30, y: nameTextField.bottom + 10, width: view.width - 80, height: 40)
        classTextField.frame = CGRect(x: 30, y: ageTextField.bottom + 10, width: view.width - 80, height: 40)
        SaveButton.frame = CGRect(x: 30, y: classTextField.bottom  + 10, width: view.width - 80, height: 40)
        
    }
    
    @objc private func SaveButtonTapped()
    {
        let name = nameTextField.text!
        let age = Int(ageTextField.text!)!
        let classes = classTextField.text!
        
        if let student = stud{
            
            CoreDataHandler.shared.update(stud: student, name: name, age: age, classes: classes){ [weak self] in
                
                //                print("data got insert")
                self?.navigationController?.popViewController(animated: true)
            }
        }
        else{
            
            CoreDataHandler.shared.insert(name: name, age: age, classes: classes) { [weak self] in
                
                self?.navigationController?.popViewController(animated: true)
                
            }
        }
    }
}
