//
//  fireplaceDetailViewController.swift
//  christmasChill
//
//  Created by Darryl Bayliss on 10/11/2015.
//  Copyright © 2015 Darryl Bayliss. All rights reserved.
//

import UIKit
import AVFoundation

class VideoViewController: UIViewController {
    
    var content: Content?
    let videoPlayer = AVPlayer()
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPlayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector:#selector(VideoViewController.restartVideoFromBeginning),
            name:.AVPlayerItemDidPlayToEndTime, object: videoPlayer.currentItem)
        
        if let videoURL = content?.video {
            loadVideo(videoURL)
        }
        
        if let audioURL = content?.sound {
            loadAudio(audioURL)
            playAudio()
        }
        
        videoPlayer.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }

    fileprivate func setupVideoPlayer() {
        let videoPlayerLayer = AVPlayerLayer(player:videoPlayer)
        videoPlayerLayer.frame = self.view.bounds;
        self.view.layer.addSublayer(videoPlayerLayer)
    }
    
    fileprivate func loadVideo(_ URLPath: URL) {
        let videoAssetURL = AVURLAsset(url: URLPath)
        let videoAssetItem = AVPlayerItem(asset: videoAssetURL)
        videoPlayer.replaceCurrentItem(with: videoAssetItem)
    }
    
    fileprivate func loadAudio(_ URLPath: URL) {
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URLPath)
                audioPlayer.prepareToPlay()
                audioPlayer.numberOfLoops = -1
        } catch {
            preconditionFailure("Audio failed to play!")
        }
    }
    
    fileprivate func playAudio() {
        audioPlayer.play()
    }
    
    func restartVideoFromBeginning() {
        
        //create a CMTime for zero seconds so we can go back to the beginning
        let seconds : Int64 = 0
        let preferredTimeScale : Int32 = 1
        let seekTime : CMTime = CMTimeMake(seconds, preferredTimeScale)
        
        videoPlayer.seek(to: seekTime)
        videoPlayer.play()
    }
}
