//
//  NASA_ImagesTests.swift
//  NASA_ImagesTests
//
//  Created by Pete Holdsworth on 10/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import XCTest
@testable import NASA_Images

class ImageCellViewModelTests: XCTestCase {

    var imageCellVMUnderTest: ImageCellViewModel?
    
    
    // This method instantiates a single ImageCellViewModel object with a dummy NASAImageData object - as expected to be returned from NASA api. The object can then be used to test that the output of any transofrmations performed by the ImageCellViewModel class is appropriate for display in the intended view.
    override func setUp() {
        // instantiate View-Model Under Test
        imageCellVMUnderTest = ImageCellViewModel(imageData: NASAImageData(
            imageURLString: "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e000261/GSFC_20171208_Archive_e000261~thumb.jpg",
            title: "Space Image Title",
            description: "This is a space image description. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ornare velit est, eu finibus mi mattis sed. Phasellus a orci sed dolor vehicula sollicitudin. Nulla ac scelerisque dui. Aliquam dui tellus, auctor vestibulum cursus quis, tristique vitae quam. Vestibulum hendrerit mi a hendrerit ultrices. Sed egestas placerat ante, ultrices fermentum justo tincidunt in. Nullam consectetur finibus sagittis. Cras nulla nulla, maximus sed ex ac, molestie maximus neque. Phasellus dapibus, nisl nec condimentum elementum, urna risus molestie nibh, at feugiat odio nulla sit amet libero. Cras in lobortis nisl, non vehicula sapien. Proin tortor justo, tincidunt sed suscipit ut, iaculis eget ex. Morbi ac accumsan urna, eu accumsan arcu. Pellentesque ut justo nunc. Ut ultricies pharetra congue. Nullam volutpat posuere odio maximus varius. Aenean non purus volutpat, aliquet dolor sit amet, semper elit.",
            center: "JDHK",
            dateCreated: "1987-09-01T00:00:00Z"
        ))
    }
    
    
    
    
    // This test ensures that the generated URL object associated with the image's Internet location is built correctly
    func testImageURLNotCreatedCorrectly() {
        let url = URL(string: "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e000261/GSFC_20171208_Archive_e000261~thumb.jpg")
        XCTAssertEqual(imageCellVMUnderTest?.imageURL, url , "ImageCellViewModel Test: image URL not created correctly")
    }
    
    // This test ensures that the title of the image is represented correctly
    func testTitleRepresentedCorrectly() {
        XCTAssertEqual(imageCellVMUnderTest?.title, "Space Image Title", "ImageCellViewModel Test: Title not represented correctly")
    }
    
    // This test ensures that the image's center and date-created are represented correctly
    func testCenterAndDateRepresentedCorrectly() {
        XCTAssertEqual(imageCellVMUnderTest?.centerAndDate, "JDHK  |  1987-09-01", "ImageCellViewModel Test: Center and date not represented correctly")
    }
    

    // This method destroys the ImageCell View-Model after each test is complete
    override func tearDown() {
        imageCellVMUnderTest = nil
    }



}
