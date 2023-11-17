//
//  SignupFirebaseManager.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/17/23.
//

import Foundation
import FirebaseAuth

extension SignupViewController{
    
    func registerNewAccount(){
        //MARK: create a Firebase user with email and password...
        if let name = signupView.textFieldName.text,
           let email = signupView.textFieldEmail.text,
           let password = signupView.textFieldPassword.text{
            if name.isEmpty {
                showErrorAlert("Name cannot be empty", self)
                return
            }
            if email.isEmpty && !isValidEmail(email) {
                showErrorAlert("Email cannot be empty and have to be a NEU email", self)
                return
            }
            if password.isEmpty && password.count < 6 {
                showErrorAlert("Password has to be at least 6 characters", self)
                return
            }
            
            Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                if error == nil{
                    //MARK: the user creation is successful...
                    self.setNameOfTheUserInFirebaseAuth(name: name)
                    
                    // push main page screen
                    let tabNavVC = TabNavBarViewController()
                    self.navigationController?.popViewController(animated: true)
                    self.navigationController?.pushViewController(tabNavVC, animated: true)
                }else{
                    //MARK: there is a error creating the user...
                    print(error)
                    showErrorAlert("Fail to create user", self)
                }
            })
        }
    }
    
    //MARK: We set the name of the user after we create the account...
    func setNameOfTheUserInFirebaseAuth(name: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                //MARK: the profile update is successful...
                self.navigationController?.popViewController(animated: true)
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
}
