//
//  Utilities.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/17/23.
//

import Foundation
import UIKit

let NEU_CAMPUS = ["Arlington", "Boston", "Charlotte", "London","Miami", "Oakland", "Portland", "San Francisco", "Silicon Valley", "Seatle", "Toronto", "Vancouver"]

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@northeastern.edu"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

func showErrorAlert(_ msg: String, _ controller:UIViewController){
    let alert = UIAlertController(title: "Error!", message: msg, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    
    controller.present(alert, animated: true)
}
