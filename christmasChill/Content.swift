//
//  Content.swift
//  christmasChill
//
//  Created by Darryl Bayliss on 11/12/2016.
//  Copyright © 2016 Darryl Bayliss. All rights reserved.
//

import UIKit


public struct Content {

    public let image : UIImage
    public let video : URL?
    public var sound : URL?
    
    init(image: String, video: String? = nil, sound: String? = nil) {
        self.image = UIImage(named:image)!
        self.video = URL(fileURLWithPath:Bundle.main.path(forResource:video, ofType: "mp4")!)
        if let soundURL = sound , let soundPath = Bundle.main.path(forResource:soundURL, ofType: "mp3") {
            self.sound = URL(fileURLWithPath:soundPath)
        }
    }
}
