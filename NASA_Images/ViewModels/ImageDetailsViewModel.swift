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
    let description: NSAttributedString!
    
    
    // Initializer uses helper methods to transform given NASAImageData and assign produced values to self
    init(imageData: NASAImageData) {
        self.imageURL = ImageDetailsViewModel.buildImageUrl(from: imageData.imageURLString)
        self.title = imageData.title
        self.center = ImageDetailsViewModel.buildCenterString(from: imageData.center)
        self.date = ImageDetailsViewModel.buildDateString(from: imageData.dateCreated)
        self.description = ImageDetailsViewModel.getDescriptionAttributedString(from: imageData.description)
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
    
    
    
    // This method returns a formatted AttributedString to represent html code as it should be seen in a web view - with html tags removed and their effect displayed instead.
    private static func getDescriptionAttributedString(from desc: String) -> NSAttributedString {

        // get data representation of given String
        guard let data = desc.data(using: String.Encoding.unicode) else {
            return NSAttributedString(string: "No valid description")
        }
        
        // create mutable AttributedString using data representation of given String - parsing text as html
        let attrStr = try? NSMutableAttributedString( // do catch
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)
        
        // define font attributes for AttributedString
        let attrs = [NSAttributedString.Key.font:
            UIFont.systemFont(ofSize: 15.0)]
        
        // add font attributes to the AttributedString and return to caller
        attrStr?.addAttributes(attrs, range: NSRange(location: 0, length: attrStr?.length ?? 0))
        return attrStr!
    }
}
