//
//  UserCampus.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/17/23.
//

import Foundation
import FirebaseFirestoreSwift

struct UserCampus:Codable{
    @DocumentID var id: String?
    var campus:String
    
    init(campus:String){
        self.campus = campus
    }
}
