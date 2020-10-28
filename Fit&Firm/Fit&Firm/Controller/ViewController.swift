//
//  ViewController.swift
//  Fit&Firm
//
//  Created by PMJs on 16/1/2563 BE.
//  Copyright © 2563 PMJs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var roundLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var startLable: UIButton!
    @IBOutlet weak var timeCountDownLable: UILabel!
    
    var customtimer = CustomTimer()
    var timer = Timer()
    var timerRoundPast = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updateUITimer()
    }

   
    @IBAction func roundLable(_ sender: UIStepper) {
        roundLable.text = String(Int(sender.value))
       customtimer.finishedRound = Int(sender.value)
        
    }
    
    @IBAction func timeStepper(_ sender: UIStepper) {
        timeLable.text = String(Int(sender.value))
        customtimer.time = Int(sender.value)
    }
    
    @IBAction func startAndStop(_ sender: UIButton) {
            customtimer.startStopTimer()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimerLable), userInfo: nil, repeats: true)
            updateUI()
        }
        
        @objc func updateTimerLable()  {
         
           self.timeCountDownLable.text = String(self.customtimer.getTimer())
           
            if timerRoundPast < 30 {
                timerRoundPast += 1
            }
            else {
                timer.invalidate()
                roundLable.text = String(customtimer.finishedRound)
                timeLable.text = String(customtimer.time)
            }
        }
    
    
    func updateUI() {
        
        if customtimer.stateTimer == 1 {
            startLable.setTitle("Stop", for: .normal)
        }
        else {
            startLable.setTitle("Start", for: .normal)
        }
    }
    
    
   
   
  
    
}

