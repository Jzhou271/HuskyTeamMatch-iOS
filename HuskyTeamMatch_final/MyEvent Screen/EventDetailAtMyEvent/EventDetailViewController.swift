//
//  EventDetailViewController.swift
//  HuskyTeamMatch_final
//
//  Created by LingjingLiu on 11/22/23.
//

import UIKit

import FirebaseFirestore
import FirebaseAuth

class EventDetailViewController: UIViewController {
    var eventDetail = EventDetailUIView()
    var event : Event?
    var eventID: String?
    
    
    override func loadView() {
      
        view = eventDetail
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        if let eventID = eventID {
                    fetchEventDetails(eventID: eventID)
                }
    
    }
    private func fetchEventDetails(eventID: String) {
            let db = Firestore.firestore()
            
            // Assuming currentUserEmail is available here. If not, you might need to fetch or pass it along.
            guard let currentUserEmail = Auth.auth().currentUser?.email else {
                print("User is not logged in")
                return
            }
            
            db.collection("users").document(currentUserEmail).collection("events").document(eventID).getDocument { [weak self] (document, error) in
                if let error = error {
                    print("Error fetching event details: \(error)")
                    return
                }
                
                guard let document = document, let data = document.data() else {
                    print("Document does not exist or data is nil")
                    return
                }
                
                let event = self?.createEventFromData(data: data)
                self?.eventDetail.configure(with: event)
            }
        }
        
        private func createEventFromData(data: [String: Any]) -> Event? {
            guard let title = data["title"] as? String,
                  let date = (data["date"] as? Timestamp)?.dateValue(),
                  let time = (data["time"] as? Timestamp)?.dateValue(),
                  let location = data["location"] as? String,
                  let maxParticipants = data["maxParticipants"] as? Int,
                  let description = data["description"] as? String else {
                return nil
            }
            
            return Event(title: title, date: date, time: time, location: location, maxParticipants: maxParticipants, description: description)
        }
    
    func  setupUI(){
        
    }
   

}
extension EventDetailUIView {
    func configure(with event: Event?) {
        guard let event = event else { return }
        
        // Update UI elements with details from the event
        titleLabel.text = event.title
        dateLabel.text = "Date: \(event.date.formatted())"
        timeLabel.text = "Time: \(event.time.formatted())"
        locationLabel.text = "Location: \(event.location)"
        capacityLabel.text = "Capacity: \(event.maxParticipants)"
        descriptionLabel.text = "Description: \(event.description)"
        
        // Handle the image if it's available
        if let image = event.image {
            // Add an UIImageView to your view if not already added, and set its image
            // imageView.image = image
        }
    }
}
