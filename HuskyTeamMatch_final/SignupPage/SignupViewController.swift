//
//  SignupViewController.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/16/23.
//

import UIKit

class SignupViewController: UIViewController {
    let signupView = SignupView()
    
    override func loadView() {
        view = signupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        signupView.buttonSignup.addTarget(self, action: #selector(buttonSignupTapped), for: .touchUpInside)
    }
    
    @objc func buttonSignupTapped() {
        let tabNavVC = TabNavBarViewController()
        self.navigationController?.pushViewController(tabNavVC, animated: true)
    }

}
