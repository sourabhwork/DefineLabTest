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
    
    private var venueArray = Array<Venue>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = allMatches
        allMatchesTableView.delegate = self
        allMatchesTableView.dataSource = self
        allMatchesTableView.tableFooterView = UIView()
        allMatchesTableView.register(UINib(nibName: TableViewCellIdentifier.matchesTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.matchesTableViewCell)
        fetchData()
    }
    
    private func fetchData() {
        //let networkServices = NetworkServices()
        //networkServices.getVenues()
        let venue = Venue()
        venue.id = "1"
        venue.name = "Baner"
        venue.city = "Pune"
        venueArray.append(venue)
        
        let venue1 = Venue()
        venue1.id = "2"
        venue1.name = "Vai"
        venue1.city = "Satara"
        venueArray.append(venue1)
        
        let venue2 = Venue()
        venue2.id = "3"
        venue2.name = "Dadar"
        venue2.city = "Mumbai  lknasd lnasd lnas dlna sdln"
        venueArray.append(venue2)
        
        let venue3 = Venue()
        venue3.id = "4"
        venue3.name = "Panhala"
        venue3.city = "Kolhapur  alsnd aslnd asl ndsal ndasl ndlas ndlas ndl nasld nasld nasl dnals dnlas ndl ansd aslnd lasnd lasn dals ndlas ndlas ndlas ndlas dnasl dnasl dnals ndla sndl asndlasnd lnas dlnasl dnasl dna sldn"
        venueArray.append(venue3)
        self.allMatchesTableView.reloadData()
    }
    
    @objc func starBtnTapp(sender: UIButton) {
        let buttonPosition : CGPoint = sender.convert(sender.bounds.origin, to: self.allMatchesTableView)
        if let indexPath = self.allMatchesTableView.indexPathForRow(at: buttonPosition) {
//            if sender.currentImage == UIImage(named: fillImage)  { // #imageLiteral(resourceName: "star") {
//                sender.setImage(#imageLiteral(resourceName: "star (3)"), for: .normal)
//            } else if sender.currentImage == UIImage(named: unfillImage) {// #imageLiteral(resourceName: "star (3)") {
//                sender.setImage(#imageLiteral(resourceName: "star"), for: .normal)
//            }
//            self.allMatchesTableView.reloadRows(at: [indexPath], with: .automatic)
            let currentVenue = venueArray[indexPath.row]
            if CoreDataHelper.venueExist(name: currentVenue.name ?? "") {
                print("Exist")
                CoreDataHelper.getVenues()
            } else {
                print("Non Exist")
                CoreDataHelper.saveMatchVenue(venue: currentVenue)
            }
        }
    }
}

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
