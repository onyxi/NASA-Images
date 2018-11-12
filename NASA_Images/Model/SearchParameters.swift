//
//  SearchParameters.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 11/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import Foundation

// This struct captures the parameters to be used in constructing the NASA API query url
struct SearchParameters {
    
    let searchString: String!
    let fromYear: Int!
    let toYear: Int!
    
    // This initializer assigns a given string to self via the encoding function below
    init(searchString: String, fromYear: Int, toYear: Int) {
        self.searchString = SearchParameters.getEncodedSearchString(from: searchString)
        self.fromYear = fromYear
        self.toYear = toYear
    }
    
    // This method ensures that a given search string is cleaned and trimmed of white space - using '%20' encoding for spaces between search terms
    private static func getEncodedSearchString(from searchString: String) -> String {
        let trimmedString = searchString.trimmingCharacters(in: .whitespacesAndNewlines)
        let encodedString = trimmedString.replacingOccurrences(of: " ", with: "%20")
        return encodedString
    }
    
}
