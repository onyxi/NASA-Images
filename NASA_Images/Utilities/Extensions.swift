//
//  Extensions.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 11/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import Foundation


extension Date {
    
    // This method returns the Integer representing the current year
    static func currentYear() -> Int
    {
        return Calendar.current.component(.year, from: Date())
    }
    
    
    
    
    
}
