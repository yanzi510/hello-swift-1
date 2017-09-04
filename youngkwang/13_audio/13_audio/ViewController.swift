//
//  ViewController.swift
//  13_audio
//
//  Created by ChoYoungKwang on 2017. 8. 28..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    var audioPlayer: AVAudioPlayer!
    var audioFile: URL!
    
    let MAX_VOLUME: Float = 10.0
    
    var progressTimer: Timer!
    
    let timePlayerSelector: Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector: Selector = #selector(ViewController.updateRecordTime)

    @IBOutlet weak var pvProgressPlay: UIProgressView!
    @IBOutlet weak var lbCurrentTime: UILabel!
    @IBOutlet weak var lbEndTime: UILabel!
    @IBOutlet weak var lbButtonPlay: UIButton!
    @IBOutlet weak var lbButtonPause: UIButton!
    @IBOutlet weak var lbButtonStop: UIButton!
    @IBOutlet weak var slVolume: UISlider!
    @IBOutlet weak var buttonRecord: UIButton!
    @IBOutlet weak var lbRecordTime: UILabel!
    
    var audioRecorder: AVAudioRecorder!
    var isRecordMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        selectAudioFile()
        if !isRecordMode {
            initPlay()
            buttonRecord.isEnabled = false
            lbRecordTime.isEnabled = false
        } else {
            initRecord()
        }
    }
    
    func selectAudioFile() {
        if !isRecordMode {
            audioFile = Bundle.main.url(forResource: "dad_is_calling", withExtension: "mp3")
        } else {
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    func initRecord() {
        let recordSetting = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey: 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0
        ] as [String: Any]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSetting)
        } catch let error as NSError {
            print("Error-initRecord: \(error)")
        }
        
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        
        slVolume.value = 1.0
        audioPlayer.volume = slVolume.value
        lbEndTime.text = convertNSTimeInterval2String(0)
        lbCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(false, pause: false, stop: false)
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch let error as NSError {
            print("Error-setCategory: \(error)")
        }
        
        do {
            try session.setActive(true)
        } catch let error as NSError {
            print("Error-setActive: \(error)")
        }
        
    }
    
    func initPlay() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            print("Error-initPlay: \(error))")
        }
        
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        
        lbEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        lbCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, pause: false, stop: false)
        
        lbButtonPlay.isEnabled = true
        lbButtonPause.isEnabled = false
        lbButtonStop.isEnabled = false
    }
    
    func setPlayButtons(_ play: Bool, pause: Bool, stop: Bool) {
        lbButtonPlay.isEnabled = play
        lbButtonPause.isEnabled = pause
        lbButtonStop.isEnabled = stop
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

    @IBAction func buttonPlay(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButtons(false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    
    func updatePlayTime() {
        lbCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    func updateRecordTime() {
        lbRecordTime.text = convertNSTimeInterval2String(audioRecorder.currentTime)
    }
    
    @IBAction func buttonPause(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
    }
    
    @IBAction func buttonStop(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lbCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, pause: true, stop: false)
        progressTimer.invalidate()
    }
    
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(true, pause: false, stop: false)
    }
    
    @IBAction func swRecordMode(_ sender: UISwitch) {
        if sender.isOn {
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lbRecordTime.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            buttonRecord.isEnabled = true
            lbRecordTime.isEnabled = true
        } else {
            isRecordMode = false
            buttonRecord.isEnabled = false
            lbRecordTime.isEnabled = false
            lbRecordTime.text = convertNSTimeInterval2String(0)
        }
        
        selectAudioFile()
        
        if !isRecordMode {
            initPlay()
        } else {
            initRecord()
        }
    }
    
    @IBAction func buttonRecord(_ sender: UIButton) {
        if sender.titleLabel?.text == "Record" {
            audioRecorder.record()
            sender.setTitle("Stop", for: UIControlState())
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        } else {
            audioRecorder.stop()
            progressTimer.invalidate()
            sender.setTitle("Record", for: UIControlState())
            lbButtonPlay.isEnabled = true
            initPlay()
        }
    }

    
    
}

