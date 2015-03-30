//
//  te.swift
//  CR-England
//
//  Created by Faisal on 12/31/14.
//  Copyright (c) 2014 Smash Analytics. All rights reserved.
//

import UIKit
import Foundation

class AngleGradientBorderLayer: AngleGradientLayer {
    
    // Properties
    var gradientBorderWidth: CGFloat = 1
    
    // Override to add a border shape to AngleGradientLayer.
    override func drawInContext(ctx: CGContext!) {
        // Draw a shape that fills the view minus the width of your final border.
        // This can be any shape you want to make a border out of.
        // This example draws a circle.
        let shapePath = UIBezierPath(roundedRect: CGRectInset(bounds, gradientBorderWidth, gradientBorderWidth), cornerRadius: bounds.height / 2)
        
        // Copy the path of the shape and turn it into a stroke.
        let shapeCopyPath = CGPathCreateCopyByStrokingPath(shapePath.CGPath, nil, gradientBorderWidth, kCGLineCapButt, kCGLineJoinBevel, 0)
        
        CGContextSaveGState(ctx)
        
        // Add the stroked path to the context and clip to it.
        CGContextAddPath(ctx, shapeCopyPath)
        CGContextClip(ctx)
        
        // Call our super class's (AngleGradientLayer) #drawInContext
        // which will do the work to create the gradient.
        super.drawInContext(ctx)
        
        CGContextRestoreGState(ctx)
    }
}
