//
//  ScreenIdentifier.swift
//  christmasChill
//
//  Created by Darryl Bayliss on 29/11/2016.
//  Copyright © 2016 Darryl Bayliss. All rights reserved.
//

import Foundation

public enum ContentIdentifier : Int {
        
    case fireplace
    case snowFalling
    case soothingCandles
    case about
    
    public func content(forIdentifier: ContentIdentifier) -> Content {
    
        let content : Content
        
        switch self {
        
        case .fireplace:
            content = Content(image: PreviewIdentifier.fireplace.rawValue, video:VideoIdentifier.fireplace.rawValue, sound:SoundIdentifier.fireplace.rawValue)
            break
            
        case .snowFalling:
            content = Content(image: PreviewIdentifier.snowFalling.rawValue, video: VideoIdentifier.snowFalling.rawValue, sound: SoundIdentifier.snowFalling.rawValue)
            break
            
        case .soothingCandles:
            content = Content(image: PreviewIdentifier.soothingCandles.rawValue, video: VideoIdentifier.soothingCandles.rawValue)
            break
            
        case .about:
            content = Content(image: PreviewIdentifier.about.rawValue)
            break
        }
    
    return content
        
    }
}

enum PreviewIdentifier : String {
    case fireplace = "fireplacePreview"
    case snowFalling = "snowFallingPreview"
    case soothingCandles = "soothingCandlesPreview"
    case about = "about"
}

enum SoundIdentifier : String {
    case fireplace = "fireplace"
    case snowFalling = "snowAudio"
    case soothingCandles = "soothingCandles"
}

enum VideoIdentifier : String {
    case fireplace = "fireplace"
    case snowFalling = "snow"
    case soothingCandles = "christmasCandles"
}
