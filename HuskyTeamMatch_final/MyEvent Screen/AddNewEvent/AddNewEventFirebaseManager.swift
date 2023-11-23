//
//  AddNewEventFirebaseManager.swift
//  HuskyTeamMatch_final
//
//  Created by Lingjing Liu on 11/22/23.
//

import Foundation
import FirebaseStorage
import Firebase
import FirebaseFirestore


extension AddNewEventViewController {
    
    class EventManager {
        let database = Firestore.firestore()
        let storage = Storage.storage()
        
        func saveNewEventToFirestore(userEmail: String, event: Event, completion: @escaping (Bool, Error?) -> Void) {
            let collectionEvents = database.collection("users").document(userEmail).collection("events")
            print("Firestore path: \(collectionEvents.path)")
            var eventData = event.dictionary
            
            if let image = event.image, let jpegData = image.jpegData(compressionQuality: 0.8) {
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesUsers")
                let imageRef = imagesRepo.child("\(UUID().uuidString).jpg")
                
                imageRef.putData(jpegData, metadata: nil) { metadata, error in
                    guard let _ = metadata else {
                        print("Error uploading image: \(String(describing: error))")
                        completion(false, error)
                        return
                    }
                    
                    imageRef.downloadURL { url, error in
                        guard let downloadURL = url else {
                            print("Error getting the download URL")
                            completion(false, error)
                            return
                        }
                        
                        eventData["imageURL"] = downloadURL.absoluteString
                        
                        collectionEvents.addDocument(data: eventData) { error in
                            if let error = error {
                                print("Error adding document: \(error)")
                                completion(false, error)
                            } else {
                                print("Event added with image successfully.")
                                completion(true, nil)
                            }
                        }
                    }
                }
            } else {
                collectionEvents.addDocument(data: eventData) { error in
                    if let error = error {
                        print("Error adding document: \(error)")
                        completion(false, error)
                    } else {
                        print("Event added without image successfully.")
                        completion(true, nil)
                    }
                }
            }
        }
    }
    
    
    
    
    
}

