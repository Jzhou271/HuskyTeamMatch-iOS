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
    var textFieldName:UITextField!
    var textFieldEmail:UITextField!
    var textFieldPassword:UITextField!
    var buttonTakePhoto:UIButton!
    var buttonSelectCampus:UIButton!
    var buttonSignup:UIButton!
    var labelPhoto:UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupTextFieldName()
        setupLabelName()
        setupLabelEmail()
        setupLabelPassword()
        setupTextFieldEmail()
        setupTextFieldPassword()
        setuplabelPhoto()
        setupButtonSelectCampus()
        setupbuttonTakePhoto()
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
    
    func setuplabelPhoto(){
        labelPhoto = UILabel()
        labelPhoto.text = "Add Profile Photo"
        labelPhoto.font = UIFont.boldSystemFont(ofSize: 14)
        labelPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhoto)
    }
    
    func setupButtonSelectCampus(){
        buttonSelectCampus = UIButton(type: .system)
        buttonSelectCampus.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSelectCampus.setTitle("Please Select a Campus", for: .normal)
        buttonSelectCampus.showsMenuAsPrimaryAction = true
        buttonSelectCampus.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSelectCampus)
    }
    
    func setupbuttonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        //buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
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
            
            buttonSelectCampus.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 10),
            buttonSelectCampus.leadingAnchor.constraint(equalTo: labelPassword.leadingAnchor),
            buttonSelectCampus.trailingAnchor.constraint(equalTo: labelPassword.trailingAnchor),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: buttonSelectCampus.bottomAnchor, constant: 10),
            buttonTakePhoto.leadingAnchor.constraint(equalTo: labelPassword.leadingAnchor),
            buttonTakePhoto.trailingAnchor.constraint(equalTo: labelPassword.trailingAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            labelPhoto.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor),
            labelPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonSignup.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 10),
            buttonSignup.leadingAnchor.constraint(equalTo: textFieldPassword.leadingAnchor),
            buttonSignup.trailingAnchor.constraint(equalTo: textFieldPassword.trailingAnchor),
        ])
    }
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


