//
//  AboutViewController.swift
//  christmasChill
//
//  Created by Darryl Bayliss on 17/11/2015.
//  Copyright © 2015 Darryl Bayliss. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet var appContentLabel: UILabel!
    
    @IBOutlet var cozyFireLabel: UILabel!
    @IBOutlet var cozyFireMakerLabel: UILabel!
    
    @IBOutlet var snowyMotionLabel: UILabel!
    @IBOutlet var christmasCandlesLabel: UILabel!
    @IBOutlet var snowyMotionMakerLabel: UILabel!
    
    @IBOutlet var wishBackgroundMusicLabel: UILabel!
    @IBOutlet var wishBackgroundMakerLabel: UILabel!
    
    @IBOutlet var xmasTreeLabel: UILabel!
    @IBOutlet var xmasTreeMakerLabel: UILabel!
    
    @IBOutlet var beyondWonderlandLabel: UILabel!
    @IBOutlet var beyondWonderlandMakerLabel: UILabel!
    
    @IBOutlet weak var dagubiVideosLabel: UILabel!
    @IBOutlet weak var dagubiVideosMakerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        appContentLabel.alpha = 0.0
        
        cozyFireLabel.alpha = 0.0
        cozyFireMakerLabel.alpha = 0.0
        
        snowyMotionLabel.alpha = 0.0
        christmasCandlesLabel.alpha = 0.0
        snowyMotionMakerLabel.alpha = 0.0
        
        wishBackgroundMusicLabel.alpha = 0.0
        wishBackgroundMakerLabel.alpha = 0.0
        
        xmasTreeLabel.alpha = 0.0
        xmasTreeMakerLabel.alpha = 0.0
        
        beyondWonderlandLabel.alpha = 0.0
        beyondWonderlandMakerLabel.alpha = 0.0
        
        dagubiVideosLabel.alpha = 0.0
        dagubiVideosMakerLabel.alpha = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1.0, delay: 0.5,
            options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                self.appContentLabel.alpha = 1.0
            }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.8,
            options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                self.cozyFireLabel.alpha = 1.0
                self.cozyFireMakerLabel.alpha = 1.0
                
                self.snowyMotionLabel.alpha = 1.0
                self.christmasCandlesLabel.alpha = 1.0
                self.snowyMotionMakerLabel.alpha = 1.0
                
                self.wishBackgroundMusicLabel.alpha = 1.0
                self.wishBackgroundMakerLabel.alpha = 1.0
            }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 1.1,
            options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                self.xmasTreeLabel.alpha = 1.0
                self.xmasTreeMakerLabel.alpha = 1.0
                
                self.beyondWonderlandLabel.alpha = 1.0
                self.beyondWonderlandMakerLabel.alpha = 1.0
            }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 1.4,
            options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
            self.dagubiVideosLabel.alpha = 1.0
            self.dagubiVideosMakerLabel.alpha = 1.0
        }, completion: nil)
    }
}
