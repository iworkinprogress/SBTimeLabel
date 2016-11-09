//
//  ViewController.swift
//  SBTimeLabel
//
//  Created by Steven Baughman on 10/18/16.
//  Copyright © 2016 Steven Baughman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SBTimeLabelDelegate {
    
    @IBOutlet var stopwatchLabel:SBTimeLabel!
    @IBOutlet var stopwatchLabel2:SBTimeLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        stopwatchLabel.start()
        stopwatchLabel.delegate = self
        stopwatchLabel2.delegate = self
    }

    @IBAction func toggleStopWatch(button:UIButton) {
        if stopwatchLabel.isRunning {
            stopwatchLabel.pause()
            button.setTitle("Start", for: .normal)
        } else {
            stopwatchLabel.start()
            button.setTitle("Pause", for: .normal)
        }
    }
    
    @IBAction func toggleStopWatch2(button:UIButton) {
        if stopwatchLabel2.isRunning {
            stopwatchLabel2.pause()
            button.setTitle("Start", for: .normal)
        } else {
            stopwatchLabel2.start()
            button.setTitle("Pause", for: .normal)
        }
    }

    //MARK: SBTimeLabelDelegate
    func didUpdateText(_ label: SBTimeLabel) {
        NSLog("stopwatch 1: \(stopwatchLabel.duration)")
        NSLog("stopwatch 2: \(stopwatchLabel2.duration)")
    }
}

