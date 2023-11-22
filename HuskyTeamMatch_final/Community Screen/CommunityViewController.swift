//
//  CommunityViewController.swift
//  HuskyTeamMatch_final
//
//  Created by Iris on 11/16/23.
//

import UIKit
import FirebaseAuth


class CommunityViewController: UIViewController {
    
    let communityView = CommunityView()
    
    override func loadView() {
        view = communityView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Community"
        
        let logoutButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(onLogoutButtonTapped))
        self.navigationItem.rightBarButtonItem = logoutButtonItem
    }
    
    @objc func onLogoutButtonTapped() {
        do {
            try Auth.auth().signOut()

            let viewController = SigninViewController()
            let navController = UINavigationController(rootViewController: viewController)

            if let window = UIApplication.shared.windows.first {
                window.rootViewController = navController
                window.makeKeyAndVisible()
            }
            
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError)")
        }
    }

}
