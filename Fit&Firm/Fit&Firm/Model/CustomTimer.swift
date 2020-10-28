//
//  CustomTimer.swift
//  Fit&Firm
//
//  Created by PMJs on 23/1/2563 BE.
//  Copyright © 2563 PMJs. All rights reserved.
//

import Foundation

class CustomTimer {
    
    var timer = Timer()
    var coundownTime : Int = 30
    var stateTimer : Int = 0 // 0 = stop , 1=start
    var finishedRound = 0
    var time = 0
    
    
    func startStopTimer()  {
        if stateTimer == 0 {
            startTimer()
            stateTimer = 1
        } else if stateTimer == 1 {
            stopTimer()
            stateTimer = 0
        }
    }
    
    func startTimer()  {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        
        if coundownTime > 0 {
            coundownTime -= 1
            print(coundownTime)
        }
        else {
            stopTimer()
            coundownTime = 30
            finishedRound += 1
            if finishedRound == 4 {
                time += 1
                finishedRound = 0      
            }
        }
    }
    
    
    func stopTimer() {
        timer.invalidate()
        
    }
    
    func isTimerOn() -> Bool {
        if stateTimer == 1 {
            return true
        } else {
            return false
        }
    }
    
    func getTimer() -> Int {
        return coundownTime
    }
    
}
