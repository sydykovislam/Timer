//
//  File.swift
//  Timer
//
//  Created by Sydykov Islam on 9/14/21.
//

import UIKit

class StopwatchVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var stopwatchLabel: UILabel!
    @IBOutlet weak var timePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.delegate = self
        timePicker.dataSource = self
        
        for i in 0..<60 {
            numbers.append(String(i))
        }
    }
    
    
    
    
    
    
    
    //MARK: - Picker setting
    var numbers = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 24
        } else {
            return 59
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numbers[row]
    }
    
    //MARK: - Stopwatch Logic
    
    var seconds = 0
    var timer = Timer()
    var isCounting = false
    
    @IBAction func startST(_ sender: UIButton) {
        if !isCounting {
            seconds = findSeconds()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timing), userInfo: nil, repeats: true)
            isCounting = true
        }
    }
    
    @IBAction func pauseST(_ sender: UIButton) {
        timer.invalidate()
        isCounting = false
    }
    
    @IBAction func stopST(_ sender: UIButton) {
        timer.invalidate()
        isCounting = false
        seconds = 0
        let time = secondsToFullVersion(seconds: seconds)
        stopwatchLabel.text = makeTimerString(hours: time.0, minutes: time.1, seconds: time.2)
    }
    
    
    @objc func timing() -> Void {
        if seconds == 1 {
            timer.invalidate()
            isCounting = false
        }
        seconds -= 1
        
        let time = secondsToFullVersion(seconds: seconds)
        stopwatchLabel.text = makeTimerString(hours: time.0, minutes: time.1, seconds: time.2)
        
    }
    func findSeconds() -> Int {
        let hours = numbers[timePicker.selectedRow(inComponent: 0)]
        let minutes = numbers[timePicker.selectedRow(inComponent: 1)]
        let secondsPick = numbers[timePicker.selectedRow(inComponent: 2)]
        let sum = Int(hours)! * 3600 + Int(minutes)! * 60 + Int(secondsPick)!
        return(sum)
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
