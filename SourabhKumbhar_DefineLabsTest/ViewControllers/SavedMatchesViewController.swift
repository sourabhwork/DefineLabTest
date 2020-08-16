//
//  SavedMatchesViewController.swift
//  SourabhKumbhar_DefineLabsTest
//
//  Created by Sourabh Kumbhar on 15/08/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import UIKit

class SavedMatchesViewController: UIViewController {
        
    @IBOutlet weak var savedMatchesTableView: UITableView!
    private var savedVenueArray  = Array<VenueEntity>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = savedMatches
        setupTableView()
        fetchVenueData()
    }
    
    private func setupTableView() {
        savedMatchesTableView.tableFooterView = UIView()
        savedMatchesTableView.register(UINib(nibName: TableViewCellIdentifier.matchesTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.matchesTableViewCell)
        savedMatchesTableView.separatorColor = UIColor.clear
        savedMatchesTableView.backgroundView = getTableViewBackgroundLabel()
    }
    
    private func fetchVenueData() {
        savedVenueArray = CoreDataHelper.getVenues()
        savedMatchesTableView.reloadData()
    }
    
    @objc func starBtnTapp(sender: UIButton) {
        let buttonPosition : CGPoint = sender.convert(sender.bounds.origin, to: self.savedMatchesTableView)
        if let indexPath = self.savedMatchesTableView.indexPathForRow(at: buttonPosition) {            
            let currentVenue = savedVenueArray[indexPath.row]
            let deleteAction = UIAlertAction(title: deleteAlert, style: .default, handler: {
                action in
                CoreDataHelper.removeVenue(player: currentVenue)
                self.savedVenueArray.remove(at: indexPath.row)
                self.savedMatchesTableView.reloadData()
            })
            let cancelAction = UIAlertAction(title: cancel, style: .cancel, handler: nil)
            self.showAlert(title: deleteAlert, message: wantDelete,actions: [deleteAction, cancelAction])
        }
    }
    
}

// MARK:- UITableView Delegates and DataSource

extension SavedMatchesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if savedVenueArray.count == 0 {
            savedMatchesTableView.backgroundView?.isHidden = false
        } else {
            savedMatchesTableView.backgroundView?.isHidden = true 
        }
        return savedVenueArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.matchesTableViewCell, for: indexPath) as! MatchesTableViewCell
        cell.starButton.addTarget(self, action: #selector(starBtnTapp(sender:)), for: .touchUpInside)
        if indexPath.row < self.savedVenueArray.count {
            let venue = savedVenueArray[indexPath.row]
            cell.configureEntityCell(venue: venue)
        }
        cell.separatorInset = .zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

