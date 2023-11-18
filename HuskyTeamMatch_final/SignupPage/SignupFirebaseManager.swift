//
//  SignupFirebaseManager.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/17/23.
//

import Foundation
import FirebaseAuth

extension SignupViewController{
    func saveCampusToFirestore(userEmail:String, campus:UserCampus){
        let collectionContacts = database
            .collection("users")
            .document(userEmail)
            .collection("campus")
        
        //MARK: show progress indicator...
        showActivityIndicator()
        do{
            try collectionContacts.addDocument(from: campus, completion: {(error) in
                if error == nil{
                    
                }
            })
        }catch{
            print("Error adding document!")
        }
    }
    
    func uploadProfilePhotoToStorage(){
        var profilePhotoURL:URL?
        
        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage{
            if let jpegData = image.jpegData(compressionQuality: 80){
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesUsers")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                
                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil{
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                profilePhotoURL = url
                                self.registerNewAccount(photoURL: profilePhotoURL)
                            }
                        })
                    }
                })
            }
        }else{
            registerNewAccount(photoURL: profilePhotoURL)
        }
    }
    
    func registerNewAccount(photoURL: URL?){
        //MARK: create a Firebase user with email and password...
        if let name = signupView.textFieldName.text,
           let email = signupView.textFieldEmail.text,
           let password = signupView.textFieldPassword.text{
            if name.isEmpty {
                showErrorAlert("Name cannot be empty", self)
                hideActivityIndicator()
                return
            }
            if email.isEmpty && !isValidEmail(email) {
                showErrorAlert("Email cannot be empty and have to be a NEU email", self)
                hideActivityIndicator()
                return
            }
            if password.isEmpty && password.count < 6 {
                showErrorAlert("Password has to be at least 6 characters", self)
                hideActivityIndicator()
                return
            }
            
            if selectedCampus == "" {
                showErrorAlert("Please select a campus", self)
                hideActivityIndicator()
                return
            }
            
            Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                if error == nil{
                    //MARK: the user creation is successful...
                    self.saveCampusToFirestore(userEmail: email, campus: UserCampus(campus: self.selectedCampus))
                    self.setNameAndPhotoOfTheUserInFirebaseAuth(name: name, email: email, photoURL: photoURL)
                    
                    // push main page screen
                    let tabNavVC = TabNavBarViewController()
                    self.navigationController?.popViewController(animated: true)
                    self.navigationController?.pushViewController(tabNavVC, animated: true)
                }else{
                    //MARK: there is a error creating the user...
                    print(error)
                    showErrorAlert("Fail to create user", self)
                    self.hideActivityIndicator()
                }
            })
        }
    }
    
    
    func setNameAndPhotoOfTheUserInFirebaseAuth(name: String, email: String, photoURL: URL?){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.photoURL = photoURL
        
        print("\(photoURL)")
        changeRequest?.commitChanges(completion: {(error) in
            if error != nil{
                print("Error occured: \(String(describing: error))")
            }else{
                self.navigationController?.popViewController(animated: true)
            }
        })
        self.hideActivityIndicator()
    }
}
