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
    
    var videoURL:NSURL = NSURL()
    var audioURL:NSURL? = NSURL()
    let videoPlayer = AVPlayer()
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupVideoPlayer()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"restartVideoFromBeginning",
            name:AVPlayerItemDidPlayToEndTimeNotification, object: self.videoPlayer.currentItem)
        
        loadVideo(videoURL)
        
        if self.audioURL != nil {
            loadAudio(audioURL!)
            playAudio()
        }
        
        playVideo()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupVideoPlayer() {
        let videoPlayerLayer = AVPlayerLayer(player:videoPlayer)
        videoPlayerLayer.frame = self.view.bounds;
        self.view.layer.addSublayer(videoPlayerLayer)
    }
    
    private func loadVideo(URLPath: NSURL) {
        let videoAssetURL = AVURLAsset(URL: URLPath)
        let videoAssetItem = AVPlayerItem(asset: videoAssetURL)
        self.videoPlayer.replaceCurrentItemWithPlayerItem(videoAssetItem)
    }
    
    private func playVideo() {
        videoPlayer.play()
    }
    
    private func loadAudio(URLPath: NSURL) {
        
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOfURL: URLPath)
                self.audioPlayer.prepareToPlay()
                self.audioPlayer.numberOfLoops = -1
        } catch {
            preconditionFailure("Audio failed to play!")
        }
    }
    
    private func playAudio() {
        self.audioPlayer.play()
    }
    
    func restartVideoFromBeginning() {
        
        //create a CMTime for zero seconds so we can go back to the beginning
        let seconds : Int64 = 0
        let preferredTimeScale : Int32 = 1
        let seekTime : CMTime = CMTimeMake(seconds, preferredTimeScale)
        
        self.videoPlayer.seekToTime(seekTime)
        self.videoPlayer.play()
    }
}
