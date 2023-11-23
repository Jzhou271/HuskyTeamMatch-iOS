//
//  Event.swift
//  HuskyTeamMatch_final
//
//  Created by Lingjing Liu on 11/20/23.
//

import Foundation
import UIKit
struct Event {
    var title: String
    var date: Date
    var time : Date
    var location: String
    var maxParticipants: Int
    var description: String
    var image: UIImage?
    
    init(title: String, date: Date, time: Date, location: String, maxParticipants: Int, description: String, image: UIImage? = nil) {
        self.title = title
        self.date = date
        self.time = time
        self.location = location
        self.maxParticipants = maxParticipants
        self.description = description
        self.image = image
      }
    
    var dictionary: [String: Any] {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateStr = dateFormatter.string(from: date)
                
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let timeStr = timeFormatter.string(from: time)
        return [
            "title": title,
            "date": dateStr,
            "time":timeStr,
             "location": location,
             "maxParticipants": maxParticipants,
             "description": description,
            
        ]
    }
    

 
}

