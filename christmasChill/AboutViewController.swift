//
//  AboutViewController.swift
//  christmasChill
//
//  Created by Darryl Bayliss on 17/11/2015.
//  Copyright © 2015 Darryl Bayliss. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet var reallyCoolAppLabel: UILabel!
    @IBOutlet var appContentLabel: UILabel!
    
    @IBOutlet var cozyFireLabel: UILabel!
    @IBOutlet var cozyFireMakerLabel: UILabel!
    
    @IBOutlet var snowyMotionLabel: UILabel!
    @IBOutlet var snowyMotionMakerLabel: UILabel!
    
    @IBOutlet var wishBackgroundMusicLabel: UILabel!
    @IBOutlet var wishBackgroundMakerLabel: UILabel!
    
    @IBOutlet var xmasTreeLabel: UILabel!
    @IBOutlet var xmasTreeMakerLabel: UILabel!
    
    @IBOutlet var beyondWonderlandLabel: UILabel!
    @IBOutlet var beyondWonderlandMakerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.reallyCoolAppLabel.alpha = 0.0
        self.appContentLabel.alpha = 0.0
        
        self.cozyFireLabel.alpha = 0.0
        self.cozyFireMakerLabel.alpha = 0.0
        
        self.snowyMotionLabel.alpha = 0.0
        self.snowyMotionMakerLabel.alpha = 0.0
        
        self.wishBackgroundMusicLabel.alpha = 0.0
        self.wishBackgroundMakerLabel.alpha = 0.0
        
        self.xmasTreeLabel.alpha = 0.0
        self.xmasTreeMakerLabel.alpha = 0.0
        
        self.beyondWonderlandLabel.alpha = 0.0
        self.beyondWonderlandMakerLabel.alpha = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1.0, delay: 0.2,
            options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.reallyCoolAppLabel.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.5,
            options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                self.appContentLabel.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.8,
            options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                self.cozyFireLabel.alpha = 1.0
                self.cozyFireMakerLabel.alpha = 1.0
                
                self.snowyMotionLabel.alpha = 1.0
                self.snowyMotionMakerLabel.alpha = 1.0
                
                self.wishBackgroundMusicLabel.alpha = 1.0
                self.wishBackgroundMakerLabel.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 1.1,
            options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                self.xmasTreeLabel.alpha = 1.0
                self.xmasTreeMakerLabel.alpha = 1.0
                
                self.beyondWonderlandLabel.alpha = 1.0
                self.beyondWonderlandMakerLabel.alpha = 1.0
            }, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}