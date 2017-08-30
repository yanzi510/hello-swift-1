//
//  ViewController.swift
//  Audio
//
//  Created by NAVER on 2017. 8. 30..
//  Copyright © 2017년 Jin Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer : AVAudioPlayer!

    var audioFile : URL!
    
    let MAX_VILUME : Float = 10.0
    
    var progressTimer : Timer!
    
    @IBOutlet weak var pvProgressPlay: UIProgressView!
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    
    @IBOutlet weak var lblEndTime: UILabel!
    
    @IBOutlet weak var btnPlay: UIButton!
    
    @IBOutlet weak var btnPause: UIButton!
    
    @IBOutlet weak var btnStop: UIButton!
    
    @IBOutlet weak var slVolume: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        audioFile = Bundle.main.url(forResource: "sound", withExtension: "ma3")
        initPlay()
    }
    
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }catch let error as NSError{
            print("Error-initPlay: \(error)")
        }
        
        slVolume.maximumValue = MAX_VILUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        
        lblEndTime.text = convertNSTimeIntercal2String(audioPlayer.duration)
        lblCurrentTime.text = convertNSTimeIntercal2String(0)
        
        btnPlay.isEnabled = true
        btnPause.isEnabled = false
        btnStop.isEnabled = false
        
    }
    
    func setPlayButtons(_ play:Bool, pause:Bool, stop:Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    
    func convertNSTimeIntercal2String(_ time:TimeInterval) -> String{
        
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPlayAudio(_ sender: UIButton) {
    }
    
    @IBAction func btnPauseAudio(_ sender: UIButton) {
    }
    
    @IBAction func btnStopAudio(_ sender: UIButton) {
    }
    
    @IBAction func slChangeVolume(_ sender: UISlider) {
    }
    
}

