//
//  ViewController.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/16/23.
//

import UIKit

class ViewController: UIViewController {
    let landingView = LandingView()
    
    override func loadView() {
        view = landingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landingView.buttonSignin.addTarget(self, action: #selector(onButtonSigninTapped), for: .touchUpInside)
    }

    @objc func onButtonSigninTapped(){
        let signinViewController = SigninViewController()
        navigationController?.pushViewController(signinViewController, animated: true)
    }
}

