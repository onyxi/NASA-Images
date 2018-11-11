//
//  NASAImage.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 10/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import Foundation

// This struct holds data related to a particluar NASA image 
struct NASAImageData {
    
    let imageURLString: String!
    let title: String!
    let description: String!
    let center: String!
    let dateCreated: String!
    
    init(imageURLString: String, title: String, description: String, center: String, dateCreated: String) {
        self.imageURLString = imageURLString
        self.title = title
        self.description = description
        self.center = center
        self.dateCreated = dateCreated
    }
    
    
    
    
    
}


