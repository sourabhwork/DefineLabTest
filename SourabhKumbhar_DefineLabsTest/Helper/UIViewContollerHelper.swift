//
//  UIViewContollerHelper.swift
//  SourabhKumbhar_DefineLabsTest
//
//  Created by Sourabh Kumbhar on 15/08/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import Foundation
import UIKit
import KYDrawerController

extension UIViewController {
    
    func showHideDrawer(drawerState: NavigationDrawerState) {
        if let topVC = self.navigationController?.parent {
            if let kyDrawerVC = topVC as? KYDrawerController {
                switch drawerState {
                case .open:
                    kyDrawerVC.setDrawerState(.opened, animated: true)
                case .close:
                    kyDrawerVC.setDrawerState(.closed, animated: true)
                }
            }
        }
    }
    
    func showAlert(title: String, message: String, actions: [UIAlertAction] = []) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if actions.isEmpty {
            let okAction = UIAlertAction(title: ok, style: .default, handler: nil)
            alertController.addAction(okAction)
        } else {
            for action in actions {
                alertController.addAction(action)
            }
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func getTableViewBackgroundLabel()-> UILabel {
        let backgroundLbl = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        backgroundLbl.text = noDataFound        
        backgroundLbl.textColor = UIColor.red
        backgroundLbl.textAlignment = .center
        return backgroundLbl
    }
}
