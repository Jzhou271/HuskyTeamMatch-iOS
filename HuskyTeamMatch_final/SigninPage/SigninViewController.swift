//
//  SigninViewController.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/16/23.
//

import UIKit

class SigninViewController: UIViewController {
    let signinView = SigninView()
    
    override func loadView() {
        view = signinView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        signinView.buttonSignin.addTarget(self, action: #selector(buttonSigninTapped), for: .touchUpInside)
    }
    
    @objc func buttonSigninTapped() {
        let tabNavVC = TabNavBarViewController()
        self.navigationController?.pushViewController(tabNavVC, animated: true)
    }

}
