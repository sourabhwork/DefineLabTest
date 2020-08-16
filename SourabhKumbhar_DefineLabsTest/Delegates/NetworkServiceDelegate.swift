//
//  NetworkServiceDelegate.swift
//  SourabhKumbhar_DefineLabsTest
//
//  Created by Sourabh Kumbhar on 15/08/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import Foundation

protocol NetworkServiceDelegate: class {
    func didGetVenueArray(venues: Array<Venue>)
    func didGetError(error: String)
}
