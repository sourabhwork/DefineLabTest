//
//  AllMatchesViewController.swift
//  SourabhKumbhar_DefineLabsTest
//
//  Created by Sourabh Kumbhar on 15/08/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import UIKit

class AllMatchesViewController: UIViewController {
    
    @IBOutlet weak var allMatchesTableView: UITableView!
    
    private var venueArray  = Array<Venue>()
    private var progressHud : ProgressHUD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = allMatches
        allMatchesTableView.tableFooterView = UIView()
        allMatchesTableView.register(UINib(nibName: TableViewCellIdentifier.matchesTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.matchesTableViewCell)
        allMatchesTableView.separatorColor = .clear
        fetchData()
    }
    
    private func fetchData() {
        progressHud = ProgressHUD(text: fetchingData)
        self.view.addSubview(progressHud!)
        progressHud?.backgroundColor = UIColor.lightGray
        let networkServices = NetworkServices()
        networkServices.getVenues()
        networkServices.networkServiceDelegate = self
    }
    
    @objc func starBtnTapp(sender: UIButton) {
        let buttonPosition : CGPoint = sender.convert(sender.bounds.origin, to: self.allMatchesTableView)
        if let indexPath = self.allMatchesTableView.indexPathForRow(at: buttonPosition) {
            let currentVenue = venueArray[indexPath.row]
            if CoreDataHelper.venueExist(venueid: currentVenue.id ?? "") {
                self.showAlert(title: starred, message: alreadyStarred)
            } else {
                CoreDataHelper.saveMatchVenue(venue: currentVenue)
                self.showAlert(title: done, message: starredSuccessfully)
                self.allMatchesTableView.reloadRows(at: [indexPath], with: .fade)
            }
        }
    }
}

// MARK:- UITableView Delegates and DataSource

extension AllMatchesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venueArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.matchesTableViewCell, for: indexPath) as! MatchesTableViewCell
        cell.starButton.addTarget(self, action: #selector(starBtnTapp(sender:)), for: .touchUpInside)
        if indexPath.row < self.venueArray.count {
            let venue = venueArray[indexPath.row]
            cell.configurCell(venue: venue)
        }
        cell.separatorInset = .zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension // 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
        //UITableView.automaticDimension // 50
    }
}

// MARK:- Custom delegate

extension AllMatchesViewController: NetworkServiceDelegate {
    
    func didGetVenueArray(venues: Array<Venue>) {
        self.progressHud?.hide()
        self.venueArray = venues
        self.allMatchesTableView.reloadData()
    }
    
    func didGetError(error: String) {
        self.showAlert(title: error, message: error)
    }
}
