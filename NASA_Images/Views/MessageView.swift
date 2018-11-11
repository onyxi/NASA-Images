//
//  MessageView.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 11/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import UIKit

// This class provides a configurable text-message and activity indicator that can be displayed to the user to inform of program state (loading, no data found etc)
class MessageView: UIView {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // This method fades the view's alpha value out to zero over a short time period
    func hide(){
        UIView.animate(withDuration: 0.8, animations: {
            self.alpha = 0.0
        })
    }
    
    // This method displays the view with full alpha
    func show(){
        self.isHidden = false
        self.alpha = 1.0
    }
    
    // This method displays a text-message and UIActivityIndicator to the user to indicate it is working
    func setMessageLoadingData(){
        messageLabel.text = "Loading data..."
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    // This method displays a text-message to the user to indicate that there is no valid data available, and removes the UIActivityIndicator if displayed.
    func setMessageNoDataAvailable(){
        messageLabel.text = "No data available"
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    
    
}
