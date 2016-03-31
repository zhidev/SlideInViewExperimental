//
//  CustomView.swift
//  OverlayedViewExp
//
//  Created by Douglas on 3/30/16.
//  Copyright © 2016 Dougli. All rights reserved.
//

import UIKit

class CustomView: UIView {

    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet var imageContent: UIImageView!
    
    @IBOutlet var imagePan: UIPanGestureRecognizer!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "CustomView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        imageContent.contentMode = UIViewContentMode.ScaleAspectFill
        contentView.backgroundColor = UIColor.grayColor()
        imageContent.clipsToBounds = true
        addSubview(contentView)
    }
    
    
    @IBAction func onImagePan(panGestureRecognizer: UIPanGestureRecognizer) {
        var point = panGestureRecognizer.locationInView(self.contentView)
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            print("Began")
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            //--------------------------------------------------------
            // Make sure we stay within the bounds of the parent view
            //--------------------------------------------------------
            //Taken from http://stackoverflow.com/questions/9314045/dragging-a-specific-uiimageview and translated to swift and this portion
            
            let midPointX = CGRectGetMidX(self.imageContent.bounds)
            // If too far right...
            if (point.x > self.imageContent.superview!.bounds.size.width  - midPointX){
                point.x = self.imageContent.superview!.bounds.size.width - midPointX
            }
            else if (point.x < midPointX){  // If too far left...
                point.x = midPointX
            }
            
            let midPointY = CGRectGetMidY(self.imageContent.bounds)
            // If too far down...
            if (point.y > self.imageContent.superview!.bounds.size.height  - midPointY){
                point.y = self.imageContent.superview!.bounds.size.height - midPointY
            }
            else if (point.y < midPointY){  // If too far up...
                point.y = midPointY
            }
            
            // Set new center location
            //self.center = newPoint Moved to animate with duration
            
            
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                self.imageContent.center = point
            })
        }else if panGestureRecognizer.state == UIGestureRecognizerState.Ended{
            print("Ended")
        }


    }
    
    
}


