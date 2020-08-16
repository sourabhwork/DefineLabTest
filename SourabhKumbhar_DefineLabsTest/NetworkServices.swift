//
//  NetworkServices.swift
//  SourabhKumbhar_DefineLabsTest
//
//  Created by Sourabh Kumbhar on 15/08/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import Foundation
import Alamofire

class NetworkServices {
    
    weak var networkServiceDelegate: NetworkServiceDelegate?
    
    func getVenues() {
                
        let request = AF.request(URLConstant.url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: .none).validate().responseJSON { response in
            print("Response ===  \(response)")
            switch response.result {
                
            case .success(_):
                let dataJson = response.data
                if let responseDictionary = response.value as? NSDictionary {
                    let requiredResponseDict = responseDictionary.value(forKey: "response") as? NSDictionary
                    var venueModelArray = [Venue]()
                    if let venueArray = requiredResponseDict?.value(forKey: venues) as? NSArray{
                        for venue in venueArray {
                            let model = Venue()
                            let venueDict = venue as? NSDictionary
                            model.name = venueDict?.value(forKey: name) as? String
                            model.id = venueDict?.value(forKey: id) as? String
                            let locate = venueDict?.value(forKey: location) as? NSDictionary
                            model.city = locate?.value(forKey: city) as? String
                            venueModelArray.append(model)
                        }
                    }
                    self.networkServiceDelegate?.didGetVenueArray(venues: venueModelArray)
                }
                
            case .failure(let error):
                self.networkServiceDelegate?.didGetError(error: error.localizedDescription)
            }
        }
        print(request.description)
    }
    
}
