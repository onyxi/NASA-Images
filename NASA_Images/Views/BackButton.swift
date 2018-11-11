//
//  BackButton.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 10/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import UIKit

// This class provides a custom UIbutton with circular-rounded corners and a 'back' arrow drawn on it
class BackButton: UIButton {

    // When button is drawn...
    override func draw(_ rect: CGRect) {
        
        // configure button shape
        self.layer.cornerRadius =  0.5 * self.bounds.size.width
        self.clipsToBounds = true
        self.titleLabel?.text = ""
        
        // Draw arrow
        let color = UIColor.white
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineWidth(2.0)
        context.setLineCap(.round)
        context.setStrokeColor(color.cgColor)
        context.beginPath()
        context.move(to: CGPoint(x: rect.maxX * 0.75  , y: rect.midY ))
        context.addLine(to: CGPoint(x: rect.maxX * 0.25, y: rect.midY))
        context.strokePath()
        context.move(to: CGPoint(x: rect.maxX * 0.4  , y: rect.maxY * 0.3 ))
        context.addLine(to: CGPoint(x: rect.maxX * 0.25, y: rect.midY))
        context.addLine(to: CGPoint(x: rect.maxX * 0.4  , y: rect.maxY * 0.7 ))
        context.strokePath()
    }
 
}
