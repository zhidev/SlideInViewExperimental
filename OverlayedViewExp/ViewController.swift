//
//  ViewController.swift
//  OverlayedViewExp
//
//  Created by Douglas on 3/30/16.
//  Copyright © 2016 Dougli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    var customViewWhenOpen: CGRect!
    var customViewWhenClosed: CGRect!
    var trueForOpenFalseForClosed = false
    var xtranslation: CGFloat!
    
    
    
    var testView: CustomView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(" VIEW : \(self.view.frame)")
        let value = UIScreen.mainScreen().bounds
        print(value)
        
        customViewWhenOpen = CGRectMake(0, 0, self.view.frame.size.width/2.5, self.view.frame.size.height)
        customViewWhenClosed = CGRectMake(-self.view.frame.size.width/2.5 + 15, 0, self.view.frame.size.width/2.5, self.view.frame.size.height)
        xtranslation = -self.view.frame.size.width/2.5 + 15
        
        testView = CustomView(frame: customViewWhenClosed)
        testView.imageContent.image = UIImage(named: "gradient")
        testView.userInteractionEnabled = true

        view.addSubview(testView)
        trueForOpenFalseForClosed = false

        
        print(testView.frame)
        let TapGesture = UITapGestureRecognizer(target: self, action: "tappedCustomView:")
        testView.addGestureRecognizer(TapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tappedCustomView(sender: UITapGestureRecognizer) {
        print(" TAP TAP REV")
        UIView.animateWithDuration(1.2) { () -> Void in
            //self.testView.center = CGPoint(x: self.testView.center.x + 200, y: self.testView.center.y+300)
            if( self.trueForOpenFalseForClosed){ // currentlyOpen
                self.testView.transform = CGAffineTransformMakeTranslation(0, 0)
                //self.testView.frame = self.customViewWhenClosed
                self.trueForOpenFalseForClosed = false
            }else{ //CurrentlyClosed
                self.testView.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width/2.5 - 15, 0)
                //self.testView.frame = self.customViewWhenOpen
                self.trueForOpenFalseForClosed = true
            }
        }
    }

}

