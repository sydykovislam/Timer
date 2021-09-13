//
//  ViewController.swift
//  Timer
//
//  Created by Sydykov Islam on 9/13/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerView: UIView!
    
    @IBOutlet weak var stopwatchView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            timerView.isHidden = false
            stopwatchView.isHidden = true
        case 1:
            timerView.isHidden = true
            stopwatchView.isHidden = true
        default:
            break
        }
    }
    
    
    //MARK: - Timer
    
}

