//
//  DevData.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 10/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import Foundation

// This struct provides offline data to allow development of the front end without yet configuring the http service
struct DevData {
    
    var NASAImagesData = [NASAImageData]()
    
    // build array of NASA image objects to be used in front-end table view 
    init() {
        
        NASAImagesData.append(NASAImageData(
            imageURLString: "https://images-assets.nasa.gov/image/as11-40-5874/as11-40-5874~thumb.jpg",
            title: "Space Image 1",
            description: "This is space image number 1",
            center: "ABC",
            dateCreated: "1969-07-21T00:00:00Z"))
        
        NASAImagesData.append(NASAImageData(
            imageURLString: "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e000261/GSFC_20171208_Archive_e000261~thumb.jpg",
            title: "Space Image 2",
            description: "This is space image number 2",
            center: "DEF",
            dateCreated: "1973-11-03T00:00:00Z"))
        
        NASAImagesData.append(NASAImageData(
            imageURLString: "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e001738/GSFC_20171208_Archive_e001738~thumb.jpg",
            title: "Space Image 3",
            description: "This is space image number 3",
            center: "GHIJ",
            dateCreated: "1969-07-05T00:00:00Z"))
        
        NASAImagesData.append(NASAImageData(
            imageURLString: "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e000677/GSFC_20171208_Archive_e000677~thumb.jpg",
            title: "Space Image 4",
            description: "This is space image number 4",
            center: "ABD",
            dateCreated: "1964-07-07T00:00:00Z"))
        
        NASAImagesData.append(NASAImageData(
            imageURLString: "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e000022/GSFC_20171208_Archive_e000022~thumb.jpg",
            title: "Space Image 5",
            description: "This is space image number 5",
            center: "JBF",
            dateCreated: "1994-10-01T00:00:00Z"))
    }
    
    
}
