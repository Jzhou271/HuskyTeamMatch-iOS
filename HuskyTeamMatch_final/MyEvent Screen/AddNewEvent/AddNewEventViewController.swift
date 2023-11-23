//
//  AddNewEventViewController.swift
//  HuskyTeamMatch_final
//
//  Created by Lingjing Liu on 11/20/23.
//

import UIKit
import PhotosUI
import MapKit
import FirebaseAuth



class AddNewEventViewController: UIViewController, MKMapViewDelegate ,UITextFieldDelegate, UITextViewDelegate{
    let addNewEvent = AddNewEvent()
    var pickedImage:UIImage?
    var mapView: MKMapView!
    var onEventCreated: ((Event) -> Void)?
    
  
    
    let eventManager = EventManager()
    
    
    override func loadView() {
        mapView = MKMapView()
        view = addNewEvent
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapView()
        setupUI()
        SetupDelegatesAndTargets()
        
        
        addNewEvent.buttonUploadPhoto.menu = getMenuImagePicker()
        addNewEvent.buttonUploadPhoto.showsMenuAsPrimaryAction = true
     

    }
    func setupMapView(){
        mapView.delegate = self
        mapView.showsUserLocation = true
        let initialLocation = CLLocation(latitude: 37.7749, longitude: -122.4194) //  location (San Francisco)
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate,
                                                          latitudinalMeters: regionRadius,
                                                          longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    
    
    
    func setupUI(){
        self.title = "Create New Event"
        
    }
    func SetupDelegatesAndTargets(){
        addNewEvent.titleTextField.delegate = self
//        addNewEvent.timeTextField.delegate = self
        addNewEvent.locationTextField.delegate = self
        addNewEvent.capacityTextField.delegate = self
        addNewEvent.descriptionTextView.delegate = self
        
        
        addNewEvent.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        addNewEvent.postButton.addTarget(self, action: #selector(postButtonTapped), for: .touchUpInside)
    }
    @objc func cancelButtonTapped(){
        resetFormFields()
        addNewEvent.event = nil
        let EventVC = MyEventViewController()
        navigationController?.pushViewController(EventVC, animated: true)
        
    }
    @objc func postButtonTapped() {
        guard
            let title = addNewEvent.titleTextField.text, !title.isEmpty,
            let location = addNewEvent.locationTextField.text, !location.isEmpty,
            let maxParticipantsText = addNewEvent.capacityTextField.text, !maxParticipantsText.isEmpty,
            let maxParticipants = Int(maxParticipantsText),
            let description = addNewEvent.descriptionTextView.text, !description.isEmpty
        else {
            alertMessage(message: "All fields are required!")
            return
        }
        
        // This is the selected date from the date picker
        let selectedDate = addNewEvent.datePicker.date
        let currentDate = Date()
        if selectedDate < currentDate {
                let alert = UIAlertController(title: "Date Error", message: "Please select a future date for the event.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                DispatchQueue.main.async { [unowned self] in
                    self.present(alert, animated: true)
                }
                return 
            }
        
        
        
        let selectedTime = addNewEvent.timePicker.date
        
        // Create the event
        let event = Event(
            title: title,
            date: selectedDate,
            time: selectedTime,
            location: location,
            maxParticipants: maxParticipants,
            description: description,
            image:pickedImage
            
        )
        
        //save event into firebase
        if let currentUserEmail = Auth.auth().currentUser?.email {
            print("Current user email: \(currentUserEmail)")
        } else {
            print("No user is currently logged in.")
        }
        guard let currentUserEmail = Auth.auth().currentUser?.email else {
            print("Cannot retrieve current user email.")
            return
        }
        print("Attempting to save event for user: \(currentUserEmail)")

        
        
        eventManager.saveNewEventToFirestore(userEmail: currentUserEmail, event: event) { [weak self] success, error in
                DispatchQueue.main.async {
                    if success {
                        let alert = UIAlertController(title: "Success", message: "Event successfully saved!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                            self?.onEventCreated?(event)
                            self?.navigationController?.popViewController(animated: true)
                        }))
                        self?.present(alert, animated: true, completion: nil)
                        self?.resetFormFields()
                    } else if let error = error {
                        self?.alertMessage(message: "There was an issue saving the event: \(error.localizedDescription)")
                    }
                }
            }
        
    }
   
    
   
    
    
    
    func resetFormFields() {
        addNewEvent.titleTextField.text = ""
        addNewEvent.datePicker.date = Date()
        addNewEvent.timePicker.date = Date()
        addNewEvent.locationTextField.text = ""
        addNewEvent.capacityTextField.text = ""
        addNewEvent.descriptionTextView.text = ""
        addNewEvent.buttonUploadPhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
    }
    
    
 
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
    
    
    
 //validate Form
    
    func alertMessage(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    //valid
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let textFieldText = textField.text else { return }
        
        if textField == addNewEvent.titleTextField {
            if textFieldText.isEmpty {
                alertMessage(message: "Title should not be empty.")
            }
        } else if textField == addNewEvent.locationTextField {
            if textFieldText.isEmpty {
                alertMessage(message: "Location should not be empty.")
            }else if !isValidLocation(textFieldText) {
                alertMessage(message: "Please  enter valid Location. eg. street,city,CA,12345.")
            }
        }
        else if textField == addNewEvent.capacityTextField {
            if textFieldText.isEmpty {
                alertMessage(message: "Maximum participants should not be empty.")
            }else if !isValidCapacity(textFieldText) {
                alertMessage(message: "Please only enter number eg. 20.")
            }
            
            
        } else if textField == addNewEvent.descriptionTextView {
            if textFieldText.isEmpty {
                alertMessage(message: "Description should not be empty.")
            }
        }
    }

    func isValidCapacity(_ title: String) -> Bool {
        let capacityRegex = "^[0-9]+$"
        let capacityTest = NSPredicate(format: "SELF MATCHES %@", capacityRegex)
        return capacityTest.evaluate(with: addNewEvent.capacityTextField.text)
    }

    func isValidTime(_ time: String)->Bool{
        let timeRegex = "^(0?[1-9]|1[0-2]):[0-5][0-9]$"
        let timeTest = NSPredicate(format:"SELF MATCHES %@", timeRegex)
        return timeTest.evaluate(with: time)
        
    }

    func isValidLocation(_ location: String) -> Bool {
        // Separate the location string into its components
        let components = location.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        
        // Check that there are 4 components: Address, City, State, Zipcode
        guard components.count == 4 else { return false }
        
        // Check that none of the components are empty
        guard !components.contains(where: { $0.isEmpty }) else { return false }
        
        // the state is a US, check for valid state abbreviation
        let states = [
            "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA",
            "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
            "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
            "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
            "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY",
            "DC","AS","GU","MP","PR","UM","VI"]

        let state = components[2]
        guard states.contains(state) else { return false }
        
        // Check for a valid US zipcode
        let zipCodeRegex = "^[0-9]{5}(-[0-9]{4})?$"
        let zipCodeTest = NSPredicate(format:"SELF MATCHES %@", zipCodeRegex)
        let zipCode = components[3]
        guard zipCodeTest.evaluate(with: zipCode) else { return false }
        return true
    }



}


extension AddNewEventViewController: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
       let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.addNewEvent.buttonUploadPhoto.setImage(
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
extension AddNewEventViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.addNewEvent.buttonUploadPhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
         
        }
    }
}


    


