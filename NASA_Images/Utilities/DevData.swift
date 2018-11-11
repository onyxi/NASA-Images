//
//  DevData.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 10/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import Foundation

// This struct provides offline data to allow development of the front end without yet configuring the http service
struct DevData {
    
    var NASAImagesData = [NASAImageData]()
    
    // build array of NASA image objects to be used in front-end table view 
    init() {
        
        NASAImagesData.append(NASAImageData(
            imageURLString: "https://images-assets.nasa.gov/image/as11-40-5874/as11-40-5874~thumb.jpg",
            title: "Space Image 1",
            description: "This is space image number 1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ornare velit est, eu finibus mi mattis sed. Phasellus a orci sed dolor vehicula sollicitudin. Nulla ac scelerisque dui. Aliquam dui tellus, auctor vestibulum cursus quis, tristique vitae quam. Vestibulum hendrerit mi a hendrerit ultrices. Sed egestas placerat ante, ultrices fermentum justo tincidunt in. Nullam consectetur finibus sagittis. Cras nulla nulla, maximus sed ex ac, molestie maximus neque. Phasellus dapibus, nisl nec condimentum elementum, urna risus molestie nibh, at feugiat odio nulla sit amet libero. Cras in lobortis nisl, non vehicula sapien. Proin tortor justo, tincidunt sed suscipit ut, iaculis eget ex. Morbi ac accumsan urna, eu accumsan arcu. Pellentesque ut justo nunc. Ut ultricies pharetra congue. Nullam volutpat posuere odio maximus varius. Aenean non purus volutpat, aliquet dolor sit amet, semper elit. Curabitur malesuada rhoncus cursus. Morbi vel lectus sed turpis luctus malesuada. In hac habitasse platea dictumst. Pellentesque nec turpis orci. Proin scelerisque pretium nisl. Phasellus egestas mattis turpis eget molestie. Donec mollis imperdiet diam, et iaculis elit pretium at. Morbi nunc lectus, elementum at massa a, laoreet tincidunt quam. Nam posuere purus ut tellus dapibus, at efficitur nisi ullamcorper. Aliquam facilisis dolor nibh, eget posuere nunc placerat sed. Aliquam vitae neque facilisis, placerat velit at, elementum metus. Mauris sed interdum arcu.",
            center: "ABC",
            dateCreated: "1969-07-21T00:00:00Z"))
        
        NASAImagesData.append(NASAImageData(
            imageURLString: "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e000261/GSFC_20171208_Archive_e000261~thumb.jpg",
            title: "Space Image 2",
            description: "This is space image number 2. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ornare velit est, eu finibus mi mattis sed. Phasellus a orci sed dolor vehicula sollicitudin. Nulla ac scelerisque dui. Aliquam dui tellus, auctor vestibulum cursus quis, tristique vitae quam. Vestibulum hendrerit mi a hendrerit ultrices. Sed egestas placerat ante, ultrices fermentum justo tincidunt in. Nullam consectetur finibus sagittis. Cras nulla nulla, maximus sed ex ac, molestie maximus neque. Phasellus dapibus, nisl nec condimentum elementum, urna risus molestie nibh, at feugiat odio nulla sit amet libero. Cras in lobortis nisl, non vehicula sapien. Proin tortor justo, tincidunt sed suscipit ut, iaculis eget ex. Morbi ac accumsan urna, eu accumsan arcu. Pellentesque ut justo nunc. Ut ultricies pharetra congue. Nullam volutpat posuere odio maximus varius. Aenean non purus volutpat, aliquet dolor sit amet, semper elit.",
            center: "DEF",
            dateCreated: "1973-11-03T00:00:00Z"))
        
        NASAImagesData.append(NASAImageData(
            imageURLString: "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e001738/GSFC_20171208_Archive_e001738~thumb.jpg",
            title: "Space Image 3",
            description: "This is space image number 3.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ornare velit est, eu finibus mi mattis sed. Phasellus a orci sed dolor vehicula sollicitudin. Nulla ac scelerisque dui. Aliquam dui tellus, auctor vestibulum cursus quis, tristique vitae quam. Vestibulum hendrerit mi a hendrerit ultrices. Sed egestas placerat ante, ultrices fermentum justo tincidunt in. Nullam consectetur finibus sagittis. Cras nulla nulla, maximus sed ex ac, molestie maximus neque. Phasellus dapibus, nisl nec condimentum elementum, urna risus molestie nibh, at feugiat odio nulla sit amet libero. Cras in lobortis nisl, non vehicula sapien. Proin tortor justo, tincidunt sed suscipit ut, iaculis eget ex. Morbi ac accumsan urna, eu accumsan arcu. Pellentesque ut justo nunc. Ut ultricies pharetra congue. Nullam volutpat posuere odio maximus varius. Aenean non purus volutpat, aliquet dolor sit amet, semper elit. Curabitur malesuada rhoncus cursus. Morbi vel lectus sed turpis luctus malesuada. In hac habitasse platea dictumst. Pellentesque nec turpis orci. Proin scelerisque pretium nisl. Phasellus egestas mattis turpis eget molestie. Donec mollis imperdiet diam, et iaculis elit pretium at. Morbi nunc lectus, elementum at massa a, laoreet tincidunt quam. Nam posuere purus ut tellus dapibus, at efficitur nisi ullamcorper. Aliquam facilisis dolor nibh, eget posuere nunc placerat sed. Aliquam vitae neque facilisis, placerat velit at, elementum metus. Mauris sed interdum arcu. Donec vel feugiat nisi, quis commodo ligula. Vestibulum pretium, orci ac iaculis dapibus, neque felis luctus odio, id aliquet mi sapien facilisis nulla. Etiam quis sapien nunc. Mauris commodo sagittis mauris, quis dictum augue tincidunt id. Aenean convallis velit felis, sed consectetur turpis maximus id. Integer ultricies justo bibendum risus maximus, sed consectetur metus congue. Nam non arcu enim. In eget finibus lectus, eu euismod justo. Fusce volutpat arcu sapien, non tempor felis varius sed. Nunc luctus massa eget vulputate interdum. Donec dictum, mauris vel maximus molestie, neque ipsum tristique libero, ac fringilla ligula arcu eget massa. Aliquam sed eros id arcu scelerisque ornare. Aenean mattis sollicitudin ante, id finibus ex condimentum in. Nunc id est eget lacus lobortis interdum. Donec sit amet ex lectus.",
            center: "GHIJ",
            dateCreated: "1969-07-05T00:00:00Z"))
        
        NASAImagesData.append(NASAImageData(
            imageURLString: "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e000677/GSFC_20171208_Archive_e000677~thumb.jpg",
            title: "Space Image 4",
            description: "This is space image number 4. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ornare velit est, eu finibus mi mattis sed. Phasellus a orci sed dolor vehicula sollicitudin. Nulla ac scelerisque dui. Aliquam dui tellus, auctor vestibulum cursus quis, tristique vitae quam. Vestibulum hendrerit mi a hendrerit ultrices. Sed egestas placerat ante, ultrices fermentum justo tincidunt in. Nullam consectetur finibus sagittis. Cras nulla nulla, maximus sed ex ac, molestie maximus neque. Phasellus dapibus, nisl nec condimentum elementum, urna risus molestie nibh, at feugiat odio nulla sit amet libero. Cras in lobortis nisl, non vehicula sapien. Proin tortor justo, tincidunt sed suscipit ut, iaculis eget ex. Morbi ac accumsan urna, eu accumsan arcu. Pellentesque ut justo nunc. Ut ultricies pharetra congue. Nullam volutpat posuere odio maximus varius. Aenean non purus volutpat, aliquet dolor sit amet, semper elit. Curabitur malesuada rhoncus cursus. Morbi vel lectus sed turpis luctus malesuada. In hac habitasse platea dictumst. Pellentesque nec turpis orci. Proin scelerisque pretium nisl. Phasellus egestas mattis turpis eget molestie. Donec mollis imperdiet diam, et iaculis elit pretium at. Morbi nunc lectus, elementum at massa a, laoreet tincidunt quam. Nam posuere purus ut tellus dapibus, at efficitur nisi ullamcorper. Aliquam facilisis dolor nibh, eget posuere nunc placerat sed. Aliquam vitae neque facilisis, placerat velit at, elementum metus. Mauris sed interdum arcu.",
            center: "ABD",
            dateCreated: "1964-07-07T00:00:00Z"))
        
        NASAImagesData.append(NASAImageData(
            imageURLString: "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e000022/GSFC_20171208_Archive_e000022~thumb.jpg",
            title: "Space Image 5",
            description: "This is space image number 5. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ornare velit est, eu finibus mi mattis sed. Phasellus a orci sed dolor vehicula sollicitudin. Nulla ac scelerisque dui. Aliquam dui tellus, auctor vestibulum cursus quis, tristique vitae quam. Vestibulum hendrerit mi a hendrerit ultrices. Sed egestas placerat ante, ultrices fermentum justo tincidunt in. Nullam consectetur finibus sagittis. Cras nulla nulla, maximus sed ex ac, molestie maximus neque. Phasellus dapibus, nisl nec condimentum elementum, urna risus molestie nibh, at feugiat odio nulla sit amet libero. Cras in lobortis nisl, non vehicula sapien. Proin tortor justo, tincidunt sed suscipit ut, iaculis eget ex. Morbi ac accumsan urna, eu accumsan arcu. Pellentesque ut justo nunc. Ut ultricies pharetra congue. Nullam volutpat posuere odio maximus varius. Aenean non purus volutpat, aliquet dolor sit amet, semper elit. Curabitur malesuada rhoncus cursus. Morbi vel lectus sed turpis luctus malesuada. In hac habitasse platea dictumst. Pellentesque nec turpis orci. Proin scelerisque pretium nisl. Phasellus egestas mattis turpis eget molestie. Donec mollis imperdiet diam, et iaculis elit pretium at. Morbi nunc lectus, elementum at massa a, laoreet tincidunt quam. Nam posuere purus ut tellus dapibus, at efficitur nisi ullamcorper. Aliquam facilisis dolor nibh, eget posuere nunc placerat sed. Aliquam vitae neque facilisis, placerat velit at, elementum metus. Mauris sed interdum arcu. Donec vel feugiat nisi, quis commodo ligula. Vestibulum pretium, orci ac iaculis dapibus, neque felis luctus odio, id aliquet mi sapien facilisis nulla. Etiam quis sapien nunc. Mauris commodo sagittis mauris, quis dictum augue tincidunt id. Aenean convallis velit felis, sed consectetur turpis maximus id. Integer ultricies justo bibendum risus maximus, sed consectetur metus congue. Nam non arcu enim. In eget finibus lectus, eu euismod justo. Fusce volutpat arcu sapien, non tempor felis varius sed. Nunc luctus massa eget vulputate interdum. Donec dictum, mauris vel maximus molestie, neque ipsum tristique libero, ac fringilla ligula arcu eget massa. Aliquam sed eros id arcu scelerisque ornare. Aenean mattis sollicitudin ante, id finibus ex condimentum in. Nunc id est eget lacus lobortis interdum. Donec sit amet ex lectus.",
            center: "JBF",
            dateCreated: "1994-10-01T00:00:00Z"))
    }
    
    
}
