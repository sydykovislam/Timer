//
//  TimerViewController.swift
//  Timer
//
//  Created by Sydykov Islam on 9/14/21.
//

import UIKit

class TimerViewController: UIViewController {
    

    @IBOutlet weak var timerString: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var seconds = 0
    var timer = Timer()
    var isCounting = false
    
    @IBAction func startTimer(_ sender: UIButton) {
        if !isCounting {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timing), userInfo: nil, repeats: true)
            isCounting = true
        }
        
    }
    @IBAction func pauseTimer(_ sender: UIButton) {
        timer.invalidate()
        isCounting = false
    }
    @IBAction func stopTimer(_ sender: UIButton) {
        timer.invalidate()
        isCounting = false
        seconds = 0
        let time = secondsToFullVersion(seconds: seconds)
        timerString.text = makeTimerString(hours: time.0, minutes: time.1, seconds: time.2)
    }
    
    @objc func timing() -> Void {
        seconds += 1
        let time = secondsToFullVersion(seconds: seconds)
        timerString.text = makeTimerString(hours: time.0, minutes: time.1, seconds: time.2)
        
    }
    
    func secondsToFullVersion(seconds: Int) -> (Int, Int, Int) {
            return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
    }
    
    func makeTimerString(hours: Int, minutes: Int, seconds : Int) -> String {
        let hoursStr = String(format: "%02d", hours)
        let minutesStr = String(format: "%02d", minutes)
        let secondsStr = String(format: "%02d", seconds)
        return(hoursStr + " : " + minutesStr + " : " + secondsStr)
    }
}
