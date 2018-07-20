//
//  ScaleInfoViewController.swift
//  Rando-Scale
//
//  Created by The Clout on 7/11/18.
//  Copyright © 2018 Draper Web Services. All rights reserved.
//

import UIKit
import AVFoundation

class ScaleInfoViewController: UIViewController {
    
    var receivedScaleLabel:String?
    
    @IBOutlet weak var scaleInfoLabel: UILabel!
    @IBOutlet weak var scaleImage: UIImageView!
    @IBOutlet weak var scaleInfoText: UITextView!
    
    //Scale Label, Image, & Description functions
    func getLabelText(){
        if (receivedScaleLabel?.isEmpty)!{
            scaleInfoLabel.text = "Major"
        }else{
            scaleInfoLabel.text = receivedScaleLabel
        }
    }
    
    func getDescription(){
        var scaleDescription = "Scale Description Here"
        scaleDescription = descriptionDictionary[scaleInfoLabel.text!]!
        scaleInfoText.text = scaleDescription
    }
    
    func getImages(){
        var scaleImageLocal:UIImage = #imageLiteral(resourceName: "c-major")
        scaleImageLocal = imageDictionary[scaleInfoLabel.text!]!
        scaleImage.image = scaleImageLocal
    }
    
    
    
    
    //Music Sample Player
    
    var musicPlayer = AVAudioPlayer()
    var musicIsPaused = true
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var musicCountdown: UILabel!
    
    
    
    
    @IBAction func playButton(_ sender: Any) {
        musicPlayer.play()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        
        if musicPlayer.isPlaying{
            musicPlayer.pause()
        }else{
            musicPlayer.play()
        }
    }
    
    @IBAction func restartButton(_ sender: Any) {
        
        if musicPlayer.isPlaying{
            musicPlayer.stop()
            musicPlayer.currentTime = 0
        }else if musicIsPaused {
            musicPlayer.stop()
            musicPlayer.currentTime = 0
        }
        
        
    }
    
    func prepSong(){
        do{
            musicPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "JesusTakeWheel", ofType: "m4a")!))
            musicPlayer.prepareToPlay()
            
        let audioSession = AVAudioSession.sharedInstance()
        
        do{
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
        }catch let sessionError{
            print(sessionError)
            }
            
        }catch let songPlayerError{
            print(songPlayerError)
        }
        
        musicTimer()
        
    }
    
    @objc func updateProgressBar(){
        
        if musicPlayer.isPlaying{
            progressBar.setProgress(Float(musicPlayer.currentTime/musicPlayer.duration), animated: true)
        }
        
    }
    
    var seconds = 0
    var timer = Timer()
    
    func musicTimer(){
        

//        var isTimerRunning = false
        
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgressBar), userInfo: nil, repeats: true)

        progressBar.setProgress(Float(musicPlayer.currentTime/musicPlayer.duration), animated: false)
        
        seconds = Int(musicPlayer.duration - musicPlayer.currentTime)
        
        musicCountdown.text = String(seconds)
        
        updateTimer()
        
        let duration = musicPlayer.duration
        let currentTime = musicPlayer.currentTime
        
        print("Song Duration is \(duration) and the current time is \(currentTime)")
    }
    
    func updateTimer(){
        seconds -= 1
        musicCountdown.text = "\(seconds)"
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLabelText()
        getDescription()
        getImages()
        prepSong()
        
//        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 10)
        
    }
    
}
