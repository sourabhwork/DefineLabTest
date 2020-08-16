//
//  MatchesTableViewCell.swift
//  SourabhKumbhar_DefineLabsTest
//
//  Created by Sourabh Kumbhar on 15/08/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {

    @IBOutlet weak var sourceView   : UIView!
    @IBOutlet weak var nameLabel    : UILabel!
    @IBOutlet weak var cityLabel    : UILabel!
    @IBOutlet weak var starButton   : UIButton!
            
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.sourceView.addShadowToView()
    }
    
    func configurCell(venue: Venue) {
        nameLabel.text = ""
        cityLabel.text = ""
        if let name = venue.name {
            nameLabel.text = name
        }
        if let city = venue.city {
            cityLabel.text = city
        }
        if let venueid = venue.id {
            if CoreDataHelper.venueExist(venueid: venueid) {
                starButton.setImage(#imageLiteral(resourceName: "ic_fillstar "), for: .normal)
            } else {
                starButton.setImage(#imageLiteral(resourceName: "ic_unfillStar"), for: .normal)
            }
        }
    }
    
    func configureEntityCell(venue: VenueEntity) {
        nameLabel.text = ""
        cityLabel.text = ""
        if let name = venue.name {
            nameLabel.text = name
        }
        if let city = venue.city {
            cityLabel.text = city
        }
        starButton.setImage(#imageLiteral(resourceName: "ic_fillstar "), for: .normal)
    }
    
    @IBAction func starButtonTapp(_ sender: UIButton) {

    }
    
}
