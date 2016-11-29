//
//  ViewController.swift
//  christmasChill
//
//  Created by Darryl Bayliss on 07/11/2015.
//  Copyright © 2015 Darryl Bayliss. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet var imagePreview: UIImageView!
    @IBOutlet var fireplaceButton: UIButton!
    @IBOutlet var fallingSnowButton: UIButton!
    @IBOutlet var soothingCandlesButton: UIButton!
    @IBOutlet var aboutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let videoVC = segue.destination as? VideoViewController {
            let segueIdentifier = segue.identifier!
            videoVC.videoURL = VideoAudioManager.sharedInstance.determineVideoWithSegueIdentifier(segueIdentifier)
            if let audioURL = VideoAudioManager.sharedInstance.determineAudioWithSegueIdentifier(segueIdentifier) {
                videoVC.audioURL = audioURL;
            } else {
                videoVC.audioURL = nil
            }
        }
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        let newImage:UIImage
        
        if context.nextFocusedView == self.fireplaceButton {
            newImage = UIImage(named: "fireplacePreview")!
        }
            
        else if context.nextFocusedView == self.fallingSnowButton {
            newImage = UIImage(named: "snowFallingPreview")!
        }
            
        else if context.nextFocusedView == self.soothingCandlesButton {
            newImage = UIImage(named: "soothingCandlesPreview")!
        }
            
        else {
            newImage = UIImage(named: "about")!
        }
        
        UIView.transition(with: self.imagePreview, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { () -> Void in
            self.imagePreview.image = newImage
            }, completion:nil)
    }
}

