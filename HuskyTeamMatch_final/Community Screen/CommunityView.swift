//
//  CommunityView.swift
//  HuskyTeamMatch_final
//
//  Created by Iris on 11/16/23.
//

import UIKit
import FirebaseAuth


class CommunityView: UIView {
    
    var greetingLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        let displayName = Auth.auth().currentUser?.displayName

        setupGreetingLabel(name: displayName)
        initConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupGreetingLabel(name: String?) {
        greetingLabel = UILabel()
        greetingLabel.text = "Welcome, \(name ?? "")!"
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(greetingLabel)
    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            greetingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        ])
    }
}
