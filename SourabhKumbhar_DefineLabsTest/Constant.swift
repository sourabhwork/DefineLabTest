//
//  Constant.swift
//  SourabhKumbhar_DefineLabsTest
//
//  Created by Sourabh Kumbhar on 15/08/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import Foundation

// MARK: - Constant keys

public let allMatches = "All Matches  💫"
public let savedMatches = "Saved Matches  ⭐️"
public let main = "Main"
public let ok = "Ok"
public let fillImage = "ic_fillstar"
public let unfillImage = "ic_unfillStar"
public let venueEntity = "VenueEntity"
public let name = "name"
public let id = "id"
public let city = "city"
public let venues = "venues"
public let location = "location"
public let error = "Error"
public let alreadyStarred = "Match already starred"
public let starredSuccessfully = "Match starred Successfully"
public let done = "Done ✅"
public let starred = "Starred 🌠"
public let deleteAlert = "Delete ❌"
public let wantDelete = "Do you want to delete the match?"
public let cancel = "cancel"
public let home = "Home 🏠"
public let fetchingData = "Fetching data"
public let noDataFound = "No data found ☹️"


// MARK: - Constant URL

struct URLConstant {
   static let url = "https://api.foursquare.com/v2/venues/search?ll=40.7484,-73.9857&oauth_token=NPKYZ3WZ1VYMNAZ2FLX1WLECAWSMUVOQZOIDBN53F3LVZBPQ&v=20180616"
}

// MARK:- Constant Storyboard Identifier

struct StoryboardIdentifier {
    static let homeViewController = ""
    static let drawerViewController = "drawerVC"
    static let AllMatchesViewController = "AllMatchesVC"
    static let SavedMatchesViewController = "SavedMatchesVC"
}

// MARK:- Constant TableView Cell

struct TableViewCellIdentifier {
    static let matchesTableViewCell = "MatchesTableViewCell"
}
