//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var howLabel: UILabel!
    @IBOutlet weak var progressEgg: UIProgressView!
    var player: AVAudioPlayer!
    
    var totalseconds: Float = 0
    let times = ["Soft" : 300, "Medium" : 480, "Hard" :  720]
    var secondsRemaining = 60
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        progressEgg.progress = 1.0
        let hardness = sender.currentTitle!
        howLabel.text = hardness
        secondsRemaining = times[hardness]!
        totalseconds = Float(secondsRemaining)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer(){
        if secondsRemaining > 0 {
            
            secondsRemaining -= 1
            let progress = Float(secondsRemaining) / totalseconds
            progressEgg.progress = progress
            
        }else {
            timer.invalidate()
            progressEgg.progress = 1.0
            howLabel.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()

        }
    }
    
    func playSound(soundName: String) {
                
    }

}
