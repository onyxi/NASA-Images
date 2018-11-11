//
//  ImageCellViewModel.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 10/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import Foundation

// This class takes a NASAImageData object and performs useful transformations to provide usable values for direct use in a ImageCell's UI outlets.
class ImageCellViewModel {
    
    let imageURL: URL!
    let title: String!
    let centerAndDate: String!
    
    // Initializer uses helper methods to transform given NASAImageData and assign produced values to self
    init(imageData: NASAImageData) {
        self.imageURL = ImageCellViewModel.buildImageUrl(from: imageData.imageURLString)
        self.title = imageData.title
        self.centerAndDate = ImageCellViewModel.buildCenterAndDateString(from: imageData.center, and: imageData.dateCreated)
    }

    // This method returns a URL object from a given String
    private static func buildImageUrl(from urlString: String) -> URL? {
        if let url = URL(string: urlString) {
            return url
        } else {
            return nil
        }
    }
    
    // This method builds a formatted String object from given NASA center and date Strings
    private static func buildCenterAndDateString(from center: String, and date: String) -> String {
        let trimmedDateString = String(date.prefix(10))
        return "\(center)  |  \(trimmedDateString)"
    }
    
    
    
}
