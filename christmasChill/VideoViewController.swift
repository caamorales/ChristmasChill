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
    
    var videoURL:URL?
    var audioURL:URL?
    let videoPlayer = AVPlayer()
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupVideoPlayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector:#selector(VideoViewController.restartVideoFromBeginning),
            name:NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.videoPlayer.currentItem)
        
        loadVideo(videoURL!)
        
        if self.audioURL != nil {
            loadAudio(audioURL!)
            playAudio()
        }
        
        playVideo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func setupVideoPlayer() {
        let videoPlayerLayer = AVPlayerLayer(player:videoPlayer)
        videoPlayerLayer.frame = self.view.bounds;
        self.view.layer.addSublayer(videoPlayerLayer)
    }
    
    fileprivate func loadVideo(_ URLPath: URL) {
        let videoAssetURL = AVURLAsset(url: URLPath)
        let videoAssetItem = AVPlayerItem(asset: videoAssetURL)
        self.videoPlayer.replaceCurrentItem(with: videoAssetItem)
    }
    
    fileprivate func playVideo() {
        videoPlayer.play()
    }
    
    fileprivate func loadAudio(_ URLPath: URL) {
        
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOf: URLPath)
                self.audioPlayer.prepareToPlay()
                self.audioPlayer.numberOfLoops = -1
        } catch {
            preconditionFailure("Audio failed to play!")
        }
    }
    
    fileprivate func playAudio() {
        self.audioPlayer.play()
    }
    
    func restartVideoFromBeginning() {
        
        //create a CMTime for zero seconds so we can go back to the beginning
        let seconds : Int64 = 0
        let preferredTimeScale : Int32 = 1
        let seekTime : CMTime = CMTimeMake(seconds, preferredTimeScale)
        
        self.videoPlayer.seek(to: seekTime)
        self.videoPlayer.play()
    }
}
