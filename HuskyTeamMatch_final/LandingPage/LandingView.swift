//
//  LandingView.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/16/23.
//

import UIKit

class LandingView: UIView {
    var labelTitle:UILabel!
    var buttonSignin:UIButton!
    var buttonSignup:UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelTitle()
        setupButtonLogin()
        setupButtonSignup()
        
        initConstraints()
    }
    
    func setupLabelTitle(){
        labelTitle = UILabel()
        labelTitle.text = "Husky Team Match"
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTitle)
    }
    
    func setupButtonLogin(){
        buttonSignin = UIButton(type: .system)
        buttonSignin.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSignin.setTitle("Sign in", for: .normal)
        buttonSignin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignin)
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
            labelTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
            labelTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            labelTitle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            buttonSignin.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10),
            buttonSignin.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            buttonSignin.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor),
            
            buttonSignup.topAnchor.constraint(equalTo: buttonSignin.bottomAnchor, constant: 10),
            buttonSignup.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            buttonSignup.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor),
        ])
    }
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
