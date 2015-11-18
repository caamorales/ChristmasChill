//
//  VideoAudioManager.swift
//  christmasChill
//
//  Created by Darryl Bayliss on 15/11/2015.
//  Copyright © 2015 Darryl Bayliss. All rights reserved.
//

import UIKit

class VideoAudioManager: NSObject {
    
    static let sharedInstance = VideoAudioManager()
    
    override init() {
        print("VideoAudioManager Singleton Initialised!")
    }
    
    internal func determineVideoWithSegueIdentifier(selectedVideo:String) -> NSURL {
        
        var videoFileName:String?
        
        switch selectedVideo {
        case "fireplaceVideo":
            videoFileName = "fireplace"
            break;
        case "snowVideo":
            videoFileName = "snow"
        default:
            preconditionFailure("VIDEO NOT FOUND")
        }
        
        let videoURLString:String? = NSBundle.mainBundle().pathForResource(videoFileName, ofType: "mp4")
        
        if(videoURLString == nil) {
            preconditionFailure("VIDEO NOT FOUND")
        }
        
        return NSURL(fileURLWithPath:videoURLString!)
    }
    
    internal func determineAudioWithSegueIdentifier(selectedVideo:String) -> NSURL? {
        
        let audioFileName:String?
        
        switch selectedVideo {
        case "fireplaceVideo":
            audioFileName = nil
            break
        case "snowVideo":
            audioFileName = "snowAudio"
        default:
            preconditionFailure("AUDIO NOT FOUND")
        }
        
        if audioFileName != nil {
            let audioURLString:String! = NSBundle.mainBundle().pathForResource(audioFileName, ofType: "mp3")
            return NSURL(fileURLWithPath:audioURLString)
        } else {
           return nil
        }
    }
}
