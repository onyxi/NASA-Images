//
//  ImageCell.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 10/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import UIKit
import Kingfisher

protocol ImageCellDelegate {
    // This ImageCellDelegate protocol method allows an image cell
    // to notify the viewController that it has been tapped.
    func imageCellTapped(row: Int)
}

// This class provides configuration of custom NASA Image tableView cells
class ImageCell: UITableViewCell {
    
    @IBOutlet weak var NASAImageView: UIImageView!
    @IBOutlet weak var imageTitleLabel: UILabel!
    @IBOutlet weak var imageCenterAndDateLabel: UILabel!
    
    var delegate: ImageCellDelegate!
    
    // When this imageCellViewModel variable is set, the cell's UI outlets are set to the object's properties
    var imageViewModel: ImageCellViewModel? {
        didSet {
            NASAImageView.kf.setImage(with: imageViewModel?.imageURL)
            imageTitleLabel.text = imageViewModel?.title
            imageCenterAndDateLabel.text = imageViewModel?.centerAndDate
        }
    }
    
    // This method notifies the delegate that this cell has been tapped - along with the cell's tag, which corresponds to it's row number in the tableView.
    @IBAction func cellButtonTapped(_ sender: Any) {
        delegate?.imageCellTapped(row: self.tag)
    }
    

}
