//
//  ViewController.swift
//  MoviePlayer
//
//  Created by NAVER on 2017. 9. 5..
//  Copyright © 2017년 Jin Lee. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        
        let filePath:String? = Bundle.main.path(forResource: "laos2", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)
        
       playVideo(url: url)
        
    }
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        let url = NSURL(string: "http://tv.naver.com/v/2026297")!
        
        playVideo(url: url)
    }
    
    private func playVideo(url: NSURL){
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        self.present(playerController, animated: true){
            player.play()
        }
    }

}

