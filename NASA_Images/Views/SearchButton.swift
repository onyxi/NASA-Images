//
//  SearchButton.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 11/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import UIKit

// This class provides a custom-formatted 'Search' button - with rounded corners
class SearchButton: UIButton {

    // When view loads provide custom formatting - rounded corners
    override func awakeFromNib() {
        self.layer.cornerRadius = 7
        self.layer.masksToBounds = true
    }
    

}
