//
//  ImageDetailsViewController.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 27/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import UIKit
import Kingfisher

// This class handles lifecycle events for the app's 'Image Details' view
class ImageDetailsViewController: UIViewController {
    
    // UI Outlets:
    @IBOutlet weak var scrollViewContainer: UIView!
    @IBOutlet weak var scrollViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Hold NASAImageData object associated with picked image:
    var imageData: NASAImageData?
    
    // When this variable is set, its formatted values are assigned to their associated ui outlets
    var imageDetailsViewModel: ImageDetailsViewModel? {
        didSet {
            imageView.kf.setImage(with: imageDetailsViewModel?.imageURL)
            titleLabel.text = imageDetailsViewModel?.title
            centerLabel.attributedText = imageDetailsViewModel?.center
            dateCreatedLabel.attributedText = imageDetailsViewModel?.date
            descriptionLabel.attributedText = imageDetailsViewModel?.description
        }
    }
    
    
    // When viewController loads instanciate new ImageDetailsviewModel object and populate UI outlets with formatted values, recalculating scroll-view height if necessary
    override func viewDidLoad() {
        super.viewDidLoad()

        // instanciate new ImageDetailsViewModel object
        imageDetailsViewModel = ImageDetailsViewModel(imageData: imageData!)
        
        // recalulate scroll-view height
        setScrollViewContainerHeight()

    }
    

    // This method recalculates the height of the scroll-view's container view to fit the description of the image
    func setScrollViewContainerHeight() {

        // get size needed for the variable-length 'descriptionLabel'
        let maxLabelWidth:CGFloat = descriptionLabel.bounds.width
        let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = imageDetailsViewModel?.description
        let neededSize:CGSize = label.sizeThatFits(CGSize(width: maxLabelWidth, height: CGFloat.greatestFiniteMagnitude))
        
        // set scroll-view container view to fit needed size - added to the fixed height components (imageView, titleLabel, centerLabel, dateCreatedLabel) and their vertical layout constraints
        let fixedLayoutComponentsHeight:CGFloat = 372
        let screenBottomMargin:CGFloat = 20
        scrollViewHeightConstraint.constant = fixedLayoutComponentsHeight + neededSize.height + screenBottomMargin
    }
    
    
    
    // This method dismisses the ImageDetailsViewController when the user presses the 'Back' button
    @IBAction func backButtonPressed(_ sender: Any){
        navigationController?.popViewController(animated: true)
    }
    
    // This method hides the navigation bar when the ImageDetailsViewController is displayed
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    // This method shows the navigation bar when the ImageDetailsViewController is dismissed
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
}
