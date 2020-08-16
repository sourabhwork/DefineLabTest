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
    
    func getVenues() {
        let request = AF.request(URLConstant.url).responseJSON {
                    response in
            print("Response ===  \(response)")
            
            switch response.result {
                
            case .success(_):
                if let data = response.data {
                    do {
                        // Parsing data and store into Website class
                        //let responseDataArray = try JSONDecoder().decode([ResponseDataModel].self, from: data)
                        // Getting data from website
                        // Iterate for loop
                        //self.delegate?.didGetData(dataModelArray: responseDataArray)
                    } catch {
                        print("Error thrown")
                    }
                }
            case .failure(let error):
                break
                //self.delegate?.didGetError(error: error.localizedDescription)
            }
        }
        print(request.description)
    }
    
}
