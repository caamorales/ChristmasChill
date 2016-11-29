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
    
    internal func determineVideoWithSegueIdentifier(_ selectedVideo:String) -> URL {
        
        var videoFileName:String?
        
        switch selectedVideo {
        case "fireplaceVideo":
            videoFileName = "fireplace"
            break;
        case "snowVideo":
            videoFileName = "snow"
            
        case "candleVideo":
            videoFileName = "christmasCandles"
        default:
            preconditionFailure("VIDEO NOT FOUND")
        }
        
        let videoURLString:String? = Bundle.main.path(forResource: videoFileName, ofType: "mp4")
        
        if(videoURLString == nil) {
            preconditionFailure("VIDEO NOT FOUND")
        }
        
        return URL(fileURLWithPath:videoURLString!)
    }
    
    internal func determineAudioWithSegueIdentifier(_ selectedVideo:String) -> URL? {
        
        let audioFileName:String?
        
        switch selectedVideo {
        case "fireplaceVideo":
            audioFileName = nil
            break
        case "snowVideo":
            audioFileName = "snowAudio"
            
        case "candleVideo":
            audioFileName = nil
        default:
            preconditionFailure("AUDIO NOT FOUND")
        }
        
        if audioFileName != nil {
            let audioURLString:String! = Bundle.main.path(forResource: audioFileName, ofType: "mp3")
            return URL(fileURLWithPath:audioURLString)
        } else {
           return nil
        }
    }
}
