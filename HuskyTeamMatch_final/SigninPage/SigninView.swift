//
//  SigninView.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/16/23.
//

import UIKit

class SigninView: UIView {
    
    var labelEmail:UILabel!
    var labelPassword:UILabel!
    var textFieldEmail:UITextField!
    var textFieldPassword:UITextField!
    var buttonSignin:UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelEmail()
        setupLabelPassword()
        setupTextFieldEmail()
        setupTextFieldPassword()
        setupButtonSignin()
        
        initConstraints()
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.text = "Username"
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setupLabelPassword(){
        labelPassword = UILabel()
        labelPassword.text = "Password"
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPassword)
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
    
    func setupButtonSignin(){
        buttonSignin = UIButton(type: .system)
        buttonSignin.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSignin.setTitle("Sign in", for: .normal)
        buttonSignin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignin)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            //bottom add view...
            labelEmail.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
            labelEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            labelEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 10),
            textFieldEmail.leadingAnchor.constraint(equalTo: labelEmail.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: labelEmail.trailingAnchor, constant: -4),
            
            labelPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 10),
            labelPassword.leadingAnchor.constraint(equalTo: textFieldEmail.leadingAnchor),
            labelPassword.trailingAnchor.constraint(equalTo: textFieldEmail.trailingAnchor, constant: -4),
            
            textFieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 10),
            textFieldPassword.leadingAnchor.constraint(equalTo: labelPassword.leadingAnchor),
            textFieldPassword.trailingAnchor.constraint(equalTo: labelPassword.trailingAnchor),
            
            buttonSignin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 10),
            buttonSignin.leadingAnchor.constraint(equalTo: textFieldPassword.leadingAnchor),
            buttonSignin.trailingAnchor.constraint(equalTo: textFieldPassword.trailingAnchor),
            
        ])
    }
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

