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
        
//    let fireplacePreviewIdentifier = "fireplacePreview"
//    
//    let snowFallingIdentifier = "snowFallingIdentifier"
//    
//    let soothingCandlesIdentifier = "soothingCandlesPreview"
//    
//    let fireplaceVideoIdentifier = "fireplaceVideo"
//    
//    let snowVideoIdentifier = "snowVideo"
//    
//    let candleVideoIdentifier = "candleVideo"
    
//    let aboutIdentifier = "about"
    
    let fileNotFound = "FILE NOT FOUND"
    
    
    override init() {
        print("VideoAudioManager Singleton Initialised!")
    }
    
    internal func determineVideoWithSegueIdentifier(_ selectedVideo:String) -> URL {
        
        var videoFileName:String?
        
        switch selectedVideo {
        case ScreenIdentifer.fireplace.rawValue:
            videoFileName = "fireplace"
            break;
        case ScreenIdentifer.snowFalling.rawValue:
            videoFileName = "snow"
        case ScreenIdentifer.soothingCandles.rawValue:
            videoFileName = "christmasCandles"
        default:
            preconditionFailure(fileNotFound)
        }
        
        let videoURLString:String? = Bundle.main.path(forResource: videoFileName, ofType: "mp4")
        
        if(videoURLString == nil) {
            preconditionFailure(fileNotFound)
        }
        
        return URL(fileURLWithPath:videoURLString!)
    }
    
    internal func determineAudioWithSegueIdentifier(_ selectedVideo:String) -> URL? {
        
        let audioFileName:String?
        
        switch selectedVideo {
        case ScreenIdentifer.fireplace.rawValue:
            audioFileName = nil
            break
        case ScreenIdentifer.snowFalling.rawValue:
            audioFileName = "snowAudio"
            
        case ScreenIdentifer.soothingCandles.rawValue:
            audioFileName = nil
        default:
            preconditionFailure(fileNotFound)
        }
        
        if audioFileName != nil {
            let audioURLString:String! = Bundle.main.path(forResource: audioFileName, ofType: "mp3")
            return URL(fileURLWithPath:audioURLString)
        } else {
           return nil
        }
    }
}
