//
//  HomeViewController.swift
//  SourabhKumbhar_DefineLabsTest
//
//  Created by Sourabh Kumbhar on 15/08/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import UIKit
import KYDrawerController

class HomeViewController: UIViewController {
    
    @IBOutlet weak var drawerBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = home
    }
    
    @IBAction func drawerButtnTapp(_ sender: UIBarButtonItem) {
        // Get top most viewController as navigation drawer and present it
        if let topVC = self.navigationController?.parent {
            if let kyDrawerVC = topVC as? KYDrawerController {
                kyDrawerVC.setDrawerState(.opened, animated: true)
                if let drawerVC = kyDrawerVC.drawerViewController as? DrawerViewController {
                    drawerVC.drawerMenuDelegate = self
                }
            }
        }
    }
}

extension HomeViewController: DrawerMenuSelectionDelegate {
    
    func didTappDrawerMenu(menu: DrawerMenu) {
        self.showHideDrawer(drawerState: .close)
        switch menu  {
        case .AllMatches:
            let storyboard = UIStoryboard(name: main, bundle: nil)
            if let allMatchesVC = storyboard.instantiateViewController(withIdentifier: StoryboardIdentifier.AllMatchesViewController) as? AllMatchesViewController {
                self.navigationController?.pushViewController(allMatchesVC, animated: true)
            }
        case .SavedMatches:
            let storyboard = UIStoryboard(name: main, bundle: nil)
            if let savedMatchesVC = storyboard.instantiateViewController(withIdentifier: StoryboardIdentifier.SavedMatchesViewController) as? SavedMatchesViewController {
                self.navigationController?.pushViewController(savedMatchesVC, animated: true)
            }
        }
    }
}
