//
//  ViewController.swift
//  christmasChill
//
//  Created by Darryl Bayliss on 07/11/2015.
//  Copyright © 2015 Darryl Bayliss. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet private weak var imagePreview: UIImageView!
    
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
    
//    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
//        
//        let newImage:UIImage
//        
//        if context.nextFocusedView == fireplaceButton {
//            newImage = UIImage(named: PreviewIdentifier.fireplace.rawValue)!
//        }
//            
//        else if context.nextFocusedView == fallingSnowButton {
//            newImage = UIImage(named: PreviewIdentifier.snowFalling.rawValue)!
//        }
//            
//        else if context.nextFocusedView == soothingCandlesButton {
//            newImage = UIImage(named: PreviewIdentifier.soothingCandles.rawValue)!
//        }
//            
//        else {
//            newImage = UIImage(named: PreviewIdentifier.about.rawValue)!
//        }
//        
//        UIView.transition(with: imagePreview, duration: 0.5, options: .transitionCrossDissolve, animations: { () -> Void in
//            self.imagePreview.image = newImage
//            }, completion:nil)
//    }
}

