//
//  SigninViewController.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/16/23.
//

import UIKit
import FirebaseAuth

class SigninViewController: UIViewController {
    let signinView = SigninView()
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = signinView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        signinView.buttonSignin.addTarget(self, action: #selector(buttonSigninTapped), for: .touchUpInside)
    }
    
    @objc func buttonSigninTapped() {
        if let email = signinView.textFieldEmail.text,
           let password = signinView.textFieldPassword.text{
            if email.isEmpty || !isValidEmail(email) {
                showErrorAlert("Invalid email", self)
                return
            }
            if password.isEmpty {
                showErrorAlert("Invalid password", self)
                return
            }

            //MARK: sign-in logic for Firebase...
            self.signInToFirebase(email: email, password: password)
        }
    }

    func signInToFirebase(email: String, password: String){
        showActivityIndicator()
        //MARK: authenticating the user...
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
            if error == nil{
                
                // push main screen
                let tabNavVC = TabNavBarViewController()
                self.navigationController?.popViewController(animated: true)
                self.navigationController?.pushViewController(tabNavVC, animated: true)
            }else{
                //MARK: alert that no user found or password wrong...
                showErrorAlert("Invalid user or wrong password", self)
            }
            
        })
        self.hideActivityIndicator()
    }
}
