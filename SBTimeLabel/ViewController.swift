//
//  ViewController.swift
//  SBTimeLabel
//
//  Created by Steven Baughman on 10/18/16.
//  Copyright © 2016 Steven Baughman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var stopwatchLabel:SBTimeLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        stopwatchLabel.start()
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

}

