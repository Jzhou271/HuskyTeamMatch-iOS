//
//  SignupViewController.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/16/23.
//

import UIKit
import PhotosUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class SignupViewController: UIViewController {
    var currentUser:FirebaseAuth.User?
    
    let signupView = SignupView()
    var selectedCampus = ""
    var pickedImage:UIImage?
    let childProgressView = ProgressSpinnerViewController()
    
    let storage = Storage.storage()
    let database = Firestore.firestore()
    
    override func loadView() {
        view = signupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupView.buttonSelectCampus.menu = getMenuCampus()
        signupView.buttonTakePhoto.menu = getMenuImagePicker()
        
        signupView.buttonSignup.addTarget(self, action: #selector(buttonSignupTapped), for: .touchUpInside)
    }
    
    @objc func buttonSignupTapped() {
        showActivityIndicator()
        uploadProfilePhotoToStorage()
    }
    
    func getMenuCampus() -> UIMenu{
        var menuItems = [UIAction]()
        
        for type in NEU_CAMPUS{
            let menuItem = UIAction(title: type,handler: {(_) in
                                self.selectedCampus = type
                                self.signupView.buttonSelectCampus.setTitle(self.selectedCampus, for: .normal)
                            })
            menuItems.append(menuItem)
        }
        
        return UIMenu(title: "Select campus", children: menuItems)
    }
    
    //MARK: menu for buttonTakePhoto setup...
    func getMenuImagePicker() -> UIMenu{
        var menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }

}

//MARK: adopting required protocols for PHPicker...
extension SignupViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.signupView.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}

//MARK: adopting required protocols for UIImagePicker...
extension SignupViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.signupView.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
}

