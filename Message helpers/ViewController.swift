//
//  ViewController.swift
//  Message helpers
//
//  Created by Macbook Air 2017 on 20. 6. 2023..
//

import UIKit

class ViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Enter internet password:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let passwordField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftViewMode = .always
        return textField
    }()
    
    let passwordLabelHelper: UILabel = {
        let label = UILabel()
        // label.text = "Password should contain between 8 and 32 characters."
        label.textColor = .red
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    lazy var passwordStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8.0
        stack.alignment = .fill
        stack.distribution = .fill
        stack.addArrangedSubview(passwordField)
        stack.addArrangedSubview(passwordLabelHelper)
        return stack
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }

    func setupUI() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        view.addSubview(passwordStack)
        passwordStack.translatesAutoresizingMaskIntoConstraints = false
        passwordStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        passwordStack.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        passwordStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        button.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        passwordField.addTarget(self, action: #selector(passwordFieldChange), for: .allEditingEvents)
    }
    
    @objc func buttonTapped() {
        guard let passwordText = passwordField.text else {
            return
        }
        
        if passwordText == "kikirikiBombona" {
            let vc = UIViewController()
            vc.view.backgroundColor = .green
            present(vc, animated: true)
            return
        }
        
        if passwordText.count == 0 {
            passwordLabelHelper.text = "You didn't enter anything."
        }
        else {
            passwordLabelHelper.text = "You entered wrong password."
        }
        passwordLabelHelper.isHidden = false
        passwordField.layer.borderColor = UIColor.red.cgColor
    }
    
    @objc func passwordFieldChange() {
        passwordField.layer.borderColor = UIColor.gray.cgColor
        passwordLabelHelper.isHidden = true
    }
}

