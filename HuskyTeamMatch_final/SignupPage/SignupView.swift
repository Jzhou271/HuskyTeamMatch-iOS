//
//  SignupView.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/16/23.
//

import UIKit

class SignupView: UIView {
    var labelName:UILabel!
    var labelEmail:UILabel!
    var labelPassword:UILabel!
    var labelLocation:UILabel!
    var textFieldName:UITextField!
    var textFieldEmail:UITextField!
    var textFieldPassword:UITextField!
    var textFieldLocation:UITextField!
    var buttonSignup:UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupTextFieldName()
        setupLabelName()
        setupLabelEmail()
        setupLabelPassword()
        setupLabelLocation()
        setupTextFieldEmail()
        setupTextFieldPassword()
        setupTextFieldLocation()
        setupButtonSignup()
        
        initConstraints()
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.text = "Name:"
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.text = "Email:"
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setupLabelPassword(){
        labelPassword = UILabel()
        labelPassword.text = "Password:"
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPassword)
    }
    
    func setupLabelLocation(){
        labelLocation = UILabel()
        labelLocation.text = "Location"
        labelLocation.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelLocation)
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.autocapitalizationType = .none
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.autocapitalizationType = .none
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.autocapitalizationType = .none
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    
    func setupTextFieldLocation(){
        textFieldLocation = UITextField()
        textFieldLocation.autocapitalizationType = .none
        textFieldLocation.borderStyle = .roundedRect
        textFieldLocation.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldLocation)
    }
    
    func setupButtonSignup(){
        buttonSignup = UIButton(type: .system)
        buttonSignup.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSignup.setTitle("Sign up", for: .normal)
        buttonSignup.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignup)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            //bottom add view...
            labelEmail.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
            labelEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            labelEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 10),
            textFieldEmail.leadingAnchor.constraint(equalTo: labelEmail.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: labelEmail.trailingAnchor),
            
            labelName.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 10),
            labelName.leadingAnchor.constraint(equalTo: labelEmail.leadingAnchor),
            labelName.trailingAnchor.constraint(equalTo: labelEmail.trailingAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 10),
            textFieldName.leadingAnchor.constraint(equalTo: labelEmail.leadingAnchor),
            textFieldName.trailingAnchor.constraint(equalTo: labelEmail.trailingAnchor),
            
            labelPassword.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 10),
            labelPassword.leadingAnchor.constraint(equalTo: textFieldEmail.leadingAnchor),
            labelPassword.trailingAnchor.constraint(equalTo: textFieldEmail.trailingAnchor),
            
            textFieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 10),
            textFieldPassword.leadingAnchor.constraint(equalTo: labelPassword.leadingAnchor),
            textFieldPassword.trailingAnchor.constraint(equalTo: labelPassword.trailingAnchor),
            
            labelLocation.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 10),
            labelLocation.leadingAnchor.constraint(equalTo: textFieldEmail.leadingAnchor),
            labelLocation.trailingAnchor.constraint(equalTo: textFieldEmail.trailingAnchor),
            
            textFieldLocation.topAnchor.constraint(equalTo: labelLocation.bottomAnchor, constant: 10),
            textFieldLocation.leadingAnchor.constraint(equalTo: labelPassword.leadingAnchor),
            textFieldLocation.trailingAnchor.constraint(equalTo: labelPassword.trailingAnchor),
            
            buttonSignup.topAnchor.constraint(equalTo: textFieldLocation.bottomAnchor, constant: 10),
            buttonSignup.leadingAnchor.constraint(equalTo: textFieldPassword.leadingAnchor),
            buttonSignup.trailingAnchor.constraint(equalTo: textFieldPassword.trailingAnchor),
        ])
    }
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


