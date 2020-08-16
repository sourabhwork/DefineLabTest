//
//  DrawerViewController.swift
//  SourabhKumbhar_DefineLabsTest
//
//  Created by Sourabh Kumbhar on 15/08/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import UIKit
import KYDrawerController

class DrawerViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let contentArray    : Array<String> = [allMatches, savedMatches]
    weak var drawerMenuDelegate : DrawerMenuSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.tableFooterView = UIView()
    }

}

// MARK:- UITableView Delegates and DataSource

extension DrawerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.row < contentArray.count {
            cell.textLabel?.text = contentArray[indexPath.row]
        }
        cell.separatorInset = .zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            self.drawerMenuDelegate?.didTappDrawerMenu(menu: .AllMatches)
        } else if indexPath.row == 1 {
            self.drawerMenuDelegate?.didTappDrawerMenu(menu: .SavedMatches)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
        
}


