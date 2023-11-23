//
//  fetchEventFirebaseManager.swift
//  HuskyTeamMatch_final
//
//  Created by Lingjing Liu on 11/22/23.
//

import Foundation




import FirebaseFirestore
import FirebaseAuth

class FirebaseEventService {
   static let sharedEvent = FirebaseEventService()
    
    private init() {}
    func loadEvents(completion: @escaping ([Event]) -> Void) {
            let db = Firestore.firestore()
            guard let currentUserEmail = Auth.auth().currentUser?.email else {
                print("User is not logged in")
                completion([])
                return
            }
            
            db.collection("users").document(currentUserEmail).collection("events").getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                    completion([])
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No documents found")
                    completion([])
                    return
                }
                
                var loadedEvents = [Event]()
                let group = DispatchGroup()
                
                for document in documents {
                    let eventData = document.data()
                    let eventID = document.documentID
                    let title = eventData["title"] as? String ?? "Untitled"
                    let date = (eventData["date"] as? Timestamp)?.dateValue() ?? Date()
                    let time = (eventData["time"] as? Timestamp)?.dateValue() ?? Date()
                    let location = eventData["location"] as? String ?? ""
                    let maxParticipants = eventData["maxParticipants"] as? Int ?? 0
                    let description = eventData["description"] as? String ?? ""
                    
                    // Handle image loading
                    if let imageURLString = eventData["imageURL"] as? String, let imageURL = URL(string: imageURLString) {
                        group.enter()
                        URLSession.shared.dataTask(with: imageURL) { data, response, error in
                            if let error = error {
                                print("Error downloading image: \(error.localizedDescription)")
                            }
                            
                            let image = data.flatMap(UIImage.init)
                            let event = Event(
                                title: title,
                                date: date,
                                time: time,
                                location: location,
                                maxParticipants: maxParticipants,
                                description: description,
                                image: image
                            )
                            
                            loadedEvents.append(event)
                            group.leave()
                        }.resume()
                    } else {
                        let event = Event(
                            title: title,
                            date: date,
                            time: time,
                            location: location,
                            maxParticipants: maxParticipants,
                            description: description,
                            image: nil
                        )
                        loadedEvents.append(event)
                    }
                }
                
                group.notify(queue: .main) {
                    completion(loadedEvents)
                }
            }
        }
    
}
