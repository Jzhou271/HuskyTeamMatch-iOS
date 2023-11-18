//
//  SignupProgressIndicatorManager.swift
//  HuskyTeamMatch_final
//
//  Created by Tian Ma on 11/17/23.
//
import Foundation

extension SignupViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
