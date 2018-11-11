//
//  ImageDetailsViewModelTests.swift
//  NASA_ImagesTests
//
//  Created by Pete Holdsworth on 11/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import XCTest
@testable import NASA_Images

class ImageDetailsViewModelTests: XCTestCase {
    
    var imageDetailsVMUnderTest: ImageDetailsViewModel?

    // This method instantiates a single ImageDetailsViewModel object with a dummy NASAImageData object - as expected to be returned from NASA api. The object can then be used to test that the output of any transofrmations performed by the ImageDetailsViewModel class is appropriate for display in the intended view.
    override func setUp() {
        // instantiate View-Model Under Test
        imageDetailsVMUnderTest = ImageDetailsViewModel(imageData: NASAImageData(
            imageURLString: "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e000677/GSFC_20171208_Archive_e000677~thumb.jpg",
            title: "Space Image Title",
            description: "This image shows the star-studded center of the Milky Way towards the constellation of Sagittarius. The crowded center of our galaxy contains numerous complex and mysterious objects that are usually hidden at optical wavelengths by clouds of dust — but many are visible here in these infrared observations from Hubble.  However, the most famous cosmic object in this image still remains invisible: the monster at our galaxy’s heart called Sagittarius A*. Astronomers have observed stars spinning around this supermassive black hole (located right in the center of the image), and the black hole consuming clouds of dust as it affects its environment with its enormous gravitational pull.  Infrared observations can pierce through thick obscuring material to reveal information that is usually hidden to the optical observer. This is the best infrared image of this region ever taken with Hubble, and uses infrared archive data from Hubble’s Wide Field Camera 3, taken in September 2011.     Credit: NASA, ESA, and G. Brammer <b><a href=\"http://www.nasa.gov/audience/formedia/features/MP_Photo_Guidelines.html\" rel=\"nofollow\">NASA image use policy.</a></b>  <b><a href=\"http://www.nasa.gov/centers/goddard/home/index.html\" rel=\"nofollow\">NASA Goddard Space Flight Center</a></b> enables NASA’s mission through four scientific endeavors: Earth Science, Heliophysics, Solar System Exploration, and Astrophysics. Goddard plays a leading role in NASA’s accomplishments by contributing compelling scientific knowledge to advance the Agency’s mission.  <b>Follow us on <a href=\"http://twitter.com/NASA_GoddardPix\" rel=\"nofollow\">Twitter</a></b>  <b>Like us on <a href=\"http://www.facebook.com/pages/Greenbelt-MD/NASA-Goddard/395013845897?ref=tsd\" rel=\"nofollow\">Facebook</a></b>  <b>Find us on <a href=\"http://instagram.com/nasagoddard?vm=grid\" rel=\"nofollow\">Instagram</a></b>",
            center: "ABC",
            dateCreated: "1964-07-07T00:00:00Z"
        ))
    }
    
    
    // This test ensures that the generated URL object associated with the image's Internet location is built correctly
    func testImageURLNotCreatedCorrectly() {
        let url = URL(string: "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e000677/GSFC_20171208_Archive_e000677~thumb.jpg")
        XCTAssertEqual(imageDetailsVMUnderTest?.imageURL, url , "ImageDetailsViewModel Test: image URL not created correctly")
    }
    
    // This test ensures that the title of the image is represented correctly
    func testTitleRepresentedCorrectly() {
        XCTAssertEqual(imageDetailsVMUnderTest?.title, "Space Image Title", "ImageDetailsViewModel Test: Title not represented correctly")
    }
    
    // This test ensures that the String to display the image's center is constructed correctly
    func testCenterStringConstructedCorrectly() {
        let constructedCenterString = "Center: ABC"
        XCTAssertEqual(imageDetailsVMUnderTest?.center.string, constructedCenterString, "ImageDetailsViewModel Test: Center not represented correctly")
    }
    
    
    // This test ensures that the String to display the image's created-date is constructed correctly
    func testDateStringConstructedCorrectly() {
        let constructedDateString = "Date Created: 1964-07-07"
        XCTAssertEqual(imageDetailsVMUnderTest?.date.string, constructedDateString, "ImageDetailsViewModel Test: Date not represented correctly")
    }
    
    
    
    // This test ensures that the 'Description' String is interpreted as HTML and represented correctly
    func testDescriptionParsedAsHTML(){
        
        let exampleDescription = "This image shows the star-studded center of the Milky Way towards the constellation of Sagittarius. The crowded center of our galaxy contains numerous complex and mysterious objects that are usually hidden at optical wavelengths by clouds of dust — but many are visible here in these infrared observations from Hubble.  However, the most famous cosmic object in this image still remains invisible: the monster at our galaxy’s heart called Sagittarius A*. Astronomers have observed stars spinning around this supermassive black hole (located right in the center of the image), and the black hole consuming clouds of dust as it affects its environment with its enormous gravitational pull.  Infrared observations can pierce through thick obscuring material to reveal information that is usually hidden to the optical observer. This is the best infrared image of this region ever taken with Hubble, and uses infrared archive data from Hubble’s Wide Field Camera 3, taken in September 2011.     Credit: NASA, ESA, and G. Brammer <b><a href=\"http://www.nasa.gov/audience/formedia/features/MP_Photo_Guidelines.html\" rel=\"nofollow\">NASA image use policy.</a></b>  <b><a href=\"http://www.nasa.gov/centers/goddard/home/index.html\" rel=\"nofollow\">NASA Goddard Space Flight Center</a></b> enables NASA’s mission through four scientific endeavors: Earth Science, Heliophysics, Solar System Exploration, and Astrophysics. Goddard plays a leading role in NASA’s accomplishments by contributing compelling scientific knowledge to advance the Agency’s mission.  <b>Follow us on <a href=\"http://twitter.com/NASA_GoddardPix\" rel=\"nofollow\">Twitter</a></b>  <b>Like us on <a href=\"http://www.facebook.com/pages/Greenbelt-MD/NASA-Goddard/395013845897?ref=tsd\" rel=\"nofollow\">Facebook</a></b>  <b>Find us on <a href=\"http://instagram.com/nasagoddard?vm=grid\" rel=\"nofollow\">Instagram</a></b>"
        
        let data = exampleDescription.data(using: String.Encoding.unicode)!
        
        let dataAsHTML = try? NSAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)
        
        XCTAssertEqual(imageDetailsVMUnderTest?.description.string, dataAsHTML?.string, "ImageDetailsViewModel Test: Description not represented correctly as HTML")
    }
    
    
    // This method destroys the ImageDetails View-Model after each test is complete
    override func tearDown() {
        imageDetailsVMUnderTest = nil
    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
