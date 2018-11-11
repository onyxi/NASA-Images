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
    
    // This method fetches data from an API. Fetched data is parsed to JSON format before being packaged and passed back to the delegate as a defined object.
    func getData() {
        
        // Build http request using Alamofire:
        Alamofire.request("https://images-api.nasa.gov/search?q=milky%20way&media_type=image&year_start=2017&year_end=2017")
            
            // handle repsonse as JSON
            .responseJSON { response in
                guard response.result.isSuccess, // check request was successful
                    
                    // check to make sure data was returned in response
                    let data = response.data else {
                        print("Failed to download data")
                        self.delegate?.finishedHTTPDataRequest(err: HTTPServiceError.DownloadError, data: nil)
                        return
                }
                
                
                // attempt to decode JSON data
                do {
                    let response = try JSONDecoder().decode(JSONResponse.self, from: data)
                    
                    // if successful package json data into array of NASAImageData objects
                    var responseImagesData = [NASAImageData]()
                    for item in response.collection.items {
                        responseImagesData.append(NASAImageData(
                            imageURLString: item.links[0].href ?? "unknown",
                            title: item.data[0].title ?? "unknown",
                            description: item.data[0].description ?? "unknown",
                            center: item.data[0].center ?? "unknown",
                            dateCreated: item.data[0].date_created ?? "unknown"))
                    }
                    
                    // pass packaged image data items back to delegate
                    self.delegate?.finishedHTTPDataRequest(err: nil, data: responseImagesData as AnyObject)
        
                    
                // if error decoding JSON data, pass error back to delegate
                } catch let jsonErr {
                    print("Failed to decode json data: \(jsonErr)")
                    self.delegate?.finishedHTTPDataRequest(err: HTTPServiceError.JSONSerializationError, data: nil)
                }
        }
    }
    
    
    
}
