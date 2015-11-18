//
//  ViewController.swift
//  christmasChill
//
//  Created by Darryl Bayliss on 07/11/2015.
//  Copyright © 2015 Darryl Bayliss. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet var fireplaceButton: UIButton!
    @IBOutlet var fallingSnowButton: UIButton!
    @IBOutlet var aboutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let videoVC = segue.destinationViewController as? VideoViewController {
            let segueIdentifier = segue.identifier!
            videoVC.videoURL = VideoAudioManager.sharedInstance.determineVideoWithSegueIdentifier(segueIdentifier)
            if let audioURL = VideoAudioManager.sharedInstance.determineAudioWithSegueIdentifier(segueIdentifier) {
                videoVC.audioURL = audioURL;
            } else {
                videoVC.audioURL = nil
            }
        }
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        
        if context.nextFocusedView == self.fireplaceButton {
          self.fireplaceButton.setContentHuggingPriority(249, forAxis:UILayoutConstraintAxis.Horizontal)
          self.fireplaceButton.setContentCompressionResistancePriority(750, forAxis: UILayoutConstraintAxis.Horizontal)
            
          self.fallingSnowButton.setContentHuggingPriority(250, forAxis: UILayoutConstraintAxis.Horizontal)
          self.fallingSnowButton.setContentCompressionResistancePriority(749, forAxis: UILayoutConstraintAxis.Horizontal)
            
          self.aboutButton.setContentHuggingPriority(250, forAxis:UILayoutConstraintAxis.Horizontal)
          self.aboutButton.setContentCompressionResistancePriority(749, forAxis: UILayoutConstraintAxis.Horizontal)
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.view.layoutIfNeeded()
                self.fireplaceButton.titleLabel?.alpha = 0.0
                self.fallingSnowButton.titleLabel?.alpha = 1.0
                self.aboutButton.titleLabel?.alpha = 1.0
            })
        }
        
        else if context.nextFocusedView == self.fallingSnowButton {
            self.fallingSnowButton.setContentHuggingPriority(249, forAxis:UILayoutConstraintAxis.Horizontal)
            self.fallingSnowButton.setContentCompressionResistancePriority(750, forAxis: UILayoutConstraintAxis.Horizontal)
            
            self.fireplaceButton.setContentHuggingPriority(250, forAxis: UILayoutConstraintAxis.Horizontal)
            self.fireplaceButton.setContentCompressionResistancePriority(749, forAxis: UILayoutConstraintAxis.Horizontal)
            
            self.aboutButton.setContentHuggingPriority(250, forAxis:UILayoutConstraintAxis.Horizontal)
            self.aboutButton.setContentCompressionResistancePriority(749, forAxis: UILayoutConstraintAxis.Horizontal)
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.view.layoutIfNeeded()
                self.fallingSnowButton.titleLabel?.alpha = 0.0
                self.fireplaceButton.titleLabel?.alpha = 1.0
                self.aboutButton.titleLabel?.alpha = 1.0
            })
        }
        
        else if context.nextFocusedView == self.aboutButton {
            
            self.aboutButton.setContentHuggingPriority(249, forAxis:UILayoutConstraintAxis.Horizontal)
            self.aboutButton.setContentCompressionResistancePriority(750, forAxis: UILayoutConstraintAxis.Horizontal)
            
            self.fireplaceButton.setContentHuggingPriority(250, forAxis: UILayoutConstraintAxis.Horizontal)
            self.fireplaceButton.setContentCompressionResistancePriority(749, forAxis: UILayoutConstraintAxis.Horizontal)
            
            self.fallingSnowButton.setContentHuggingPriority(250, forAxis: UILayoutConstraintAxis.Horizontal)
            self.fallingSnowButton.setContentCompressionResistancePriority(749, forAxis: UILayoutConstraintAxis.Horizontal)

            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                self.view.layoutIfNeeded()
                self.aboutButton.titleLabel?.alpha = 0.0
                self.fallingSnowButton.titleLabel?.alpha = 1.0
                self.fireplaceButton.titleLabel?.alpha = 1.0
            })
        }
    }
}

