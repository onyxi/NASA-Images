//
//  HTTPService.swift
//  WeatherApp_FuturePlatforms
//
//  Created by Pete Holdsworth on 06/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import Foundation
import Alamofire

// Protocol definition for users of the HTTPService class
protocol HTTPServiceDelegate {
    func finishedHTTPDataRequest(err: HTTPServiceError?, data: AnyObject?)
}

// Errors thrown by the HTTPService class
enum HTTPServiceError: Error {
    case DownloadError
    case JSONSerializationError
}

// This class class provides access to HTTP services and allows the app to request image data from NASA's REST api.
class HTTPService {
    
    var delegate: HTTPServiceDelegate?
    
    // This method fetches data from an API. Fetched data is parsed to JSON format before being packeaged and passed back to the delegate as a defined object.
    func getData() {
        
        // Build http request using Alamofire:
        Alamofire.request("") // build url !!!!!
            
            // handle repsonse as JSON
            .responseJSON { response in
                guard response.result.isSuccess, // check request was successful
                    
                    // check to make sure data was returned in response
                    let jsonData = response.data else {
                        print("Failed to download data")
//                        self.delegate?.finishedHTTPDataRequest(err: HTTPServiceError.DownloadError, weatherData: nil)
                        return
                }
                
                // attempt to decode JSON data
                do {
                    // !!!! insert JSON decodable type *******
//                    let jsonWeatherData = try JSONDecoder().decode(******.self, from: jsonData)
                    
                    // if successful, package as data object and return to delegate
                    // let packagedObject = *****
                    
                    // self.delegate?.finishedHTTPDataRequest(err: nil, data: *packagedObject*)
                    
                } catch let jsonErr {
                    // if error decoding JSON data, pass error back to delegate
                    print("Failed to decode json data: \(jsonErr)")
//                    self.delegate?.finishedHTTPDataRequest(err: HTTPServiceError.JSONSerializationError, weatherData: nil)
                }
        }
    }
    
    
    
}
