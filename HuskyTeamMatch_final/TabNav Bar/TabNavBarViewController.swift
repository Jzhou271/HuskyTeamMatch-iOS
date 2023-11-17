//
//  TabNavBarViewController.swift
//  HuskyTeamMatch_final
//
//  Created by Iris on 11/16/23.
//

import UIKit

class TabNavBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabEvent = UINavigationController(rootViewController: MyEventViewController())
        
        let tabEventItem = UITabBarItem(
                    title: "MyEvent",
                    image: UIImage(systemName: "calendar.circle")?.withRenderingMode(.alwaysTemplate),
                    selectedImage: UIImage(systemName: "calendar.circle.fill")
                )
        tabEvent.tabBarItem = tabEventItem
        
        let tabCommunity = UINavigationController(rootViewController: CommunityViewController())
        
        let tabCommunityItem = UITabBarItem(
                    title: "Community",
                    image: UIImage(systemName: "c.circle")?.withRenderingMode(.alwaysTemplate),
                    selectedImage: UIImage(systemName: "c.circle.fill")
                )
        tabCommunity.tabBarItem = tabCommunityItem
        
        let tabProfile = UINavigationController(rootViewController: MyProfileViewController())
        
        let tabProfileItem = UITabBarItem(
                    title: "Profile",
                    image: UIImage(systemName: "person")?.withRenderingMode(.alwaysTemplate),
                    selectedImage: UIImage(systemName: "person.fill")
                )
        tabProfile.tabBarItem = tabProfileItem
        
        self.viewControllers = [tabEvent, tabCommunity, tabProfile]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}
