//
//  VideoAudioManager.swift
//  christmasChill
//
//  Created by Darryl Bayliss on 15/11/2015.
//  Copyright © 2015 Darryl Bayliss. All rights reserved.
//

class ContentManager {
    
    public var content : [Content]
    
    init() {

        let contentIdentifiers = [ContentIdentifier.fireplace, ContentIdentifier.snowFalling, ContentIdentifier.soothingCandles, ContentIdentifier.festiveSnow, ContentIdentifier.christmasTree, ContentIdentifier.threeKings, ContentIdentifier.about]
        
        var content : [Content] = []
        
        for contentIdentifier in contentIdentifiers {
            content.append(contentIdentifier.content(forIdentifier: contentIdentifier))
        }
        
        self.content = content
    }
}
