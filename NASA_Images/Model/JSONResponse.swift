//
//  NASAImagesJSONData.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 11/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import Foundation


// This struct allows JSON data from the NASA api to be extracted and decoded into a more usable object
struct JSONResponse: Decodable {
    let collection: ResponseCollection!
}


// top level dictionary object
struct ResponseCollection: Decodable {
    let items : [ResponseItem]!
}

// second level dictionary object
struct ResponseItem: Decodable {
    let data: [ItemData]!
    let links: [ItemLinks]!
}

// third level dictionary object
struct ItemData: Decodable {
    let center: String?
    let date_created: String?
    let description: String?
    let title: String?
}

// third level dictionary object
struct ItemLinks: Decodable {
    let href: String?
}
