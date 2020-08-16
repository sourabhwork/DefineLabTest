//
//  CoreDataHelper.swift
//  SourabhKumbhar_DefineLabsTest
//
//  Created by Sourabh Kumbhar on 15/08/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHelper {
    
    static let context = AppDelegate().persistentContainer.viewContext
    
    class func saveMatchVenue(venue: Venue) {
        let venue_entity = NSEntityDescription.insertNewObject(forEntityName: venueEntity, into: context) as! VenueEntity
        venue_entity.id = venue.id
        venue_entity.city = venue.city
        venue_entity.name = venue.name
        do {
            try context.save()
        } catch let error {
            print("Error = \(error.localizedDescription)")
        }
    }
    
    class func getVenues()-> Array<VenueEntity> {
        var venueArray = Array<VenueEntity>()
        let request = NSFetchRequest<VenueEntity>(entityName: venueEntity)
        do {
            let resultArrray = try context.fetch(request)
            venueArray = resultArrray
        } catch let error {
            print("Error = \(error.localizedDescription)")
        }
        return venueArray
    }
    
    class func venueExist(venueid: String)-> Bool {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: venueEntity)
        fetchRequest.predicate = NSPredicate(format: "id = %@", venueid)
        var results: [NSManagedObject] = []
        do {
            results = try context.fetch(fetchRequest)
        }
        catch {
            print("error executing fetch request: \(error)")
        }
        return results.count > 0
    }
    
    class func removeVenue(player: VenueEntity) {
        context.delete(player)
        do {
            try context.save()
        } catch let error {
            print("Error \(error.localizedDescription)")
        }
    }
}
