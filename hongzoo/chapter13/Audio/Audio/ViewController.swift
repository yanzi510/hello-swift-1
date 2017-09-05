//
//  ViewController.swift
//  Audio
//
//  Created by Hongzoo on 2017. 8. 30..
//  Copyright © 2017년 Hongzoo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer : AVAudioPlayer!
    var audioFile : URL!
    let MAX_VOLUME : Float = 10.0
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
        audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        initPlay()
    }
    
    func initPlay() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            print("Error-initPlay : \(error)")
        }
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        
        lblEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        
        setPlayButtons(true, pause: false, stop: false)
    }
    
    func setPlayButtons(_ play:Bool, pause:Bool, stop:Bool) {
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    func convertNSTimeInterval2String(_ time: TimeInterval) -> String {
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
        audioPlayer.play()
        setPlayButtons(false, pause: true, stop: true)
    }
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
    }
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        setPlayButtons(true, pause: false, stop: false)
    }
    @IBAction func slChangeVolume(_ sender: UISlider) {
    }
}

