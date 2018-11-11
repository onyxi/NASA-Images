//
//  ImageDetailsViewModel.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 10/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import UIKit

// This class takes a NASAImageData object and performs useful transformations to provide usable values for direct use in a ImageCell's UI outlets.
class ImageDetailsViewModel {
    
    let imageURL: URL!
    let title: String!
    let center: NSAttributedString!
    let date: NSAttributedString!
    let description: String!
    
    
    // Initializer uses helper methods to transform given NASAImageData and assign produced values to self
    init(imageData: NASAImageData) {
        self.imageURL = ImageDetailsViewModel.buildImageUrl(from: imageData.imageURLString)
        self.title = imageData.title
        self.center = ImageDetailsViewModel.buildCenterString(from: imageData.center)
        self.date = ImageDetailsViewModel.buildDateString(from: imageData.dateCreated)
        self.description = imageData.description
    }
    
    
    // This method returns a URL object from a given String
    private static func buildImageUrl(from urlString: String) -> URL? {
        if let url = URL(string: urlString) {
            return url
        } else {
            return nil
        }
    }
    

    // This method builds a formatted String object from given NASA center String
    private static func buildCenterString(from center: String) -> NSAttributedString {
        let centerLabelString = "Center: \(center)"
        let attrs = [NSAttributedString.Key.font:
            UIFont.boldSystemFont(ofSize: 15.0)]
        
        // make 'Center:' part of String bold
        let centerLabelAttributedString = NSMutableAttributedString(string: centerLabelString)
        centerLabelAttributedString.addAttributes(attrs, range: NSRange(location:0, length: 7))
        
        return centerLabelAttributedString
    }
    
    
    // This method builds a formatted String object from given date String
    private static func buildDateString(from date: String) -> NSAttributedString {
        let trimmedDateString = String(date.prefix(10))
        let dateLabelString = "Date Created: \(trimmedDateString)"
        
        // make 'Date Created:' part of String bold
        let attrs = [NSAttributedString.Key.font:
            UIFont.boldSystemFont(ofSize: 15.0)]
        let dateLabelAttributedString = NSMutableAttributedString(string: dateLabelString)
        dateLabelAttributedString.addAttributes(attrs, range: NSRange(location:0, length: 13))
        
        return dateLabelAttributedString
    }
    
    
    
}
