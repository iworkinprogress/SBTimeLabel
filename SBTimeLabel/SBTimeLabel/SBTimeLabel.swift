//
//  SBTimeLabel.swift
//  SBTimeLabel
//
//  Created by Steven Baughman on 10/18/16.
//  Copyright © 2016 Steven Baughman. All rights reserved.
//

import UIKit

enum TimerType {
    case stopwatch
    case countdown
    case clock
}
enum TimerAccurracy {
    case milliseconds
    case seconds
}

open class SBTimeLabel: UILabel {
    
    var type:TimerType = .stopwatch
    var accurracy:TimerAccurracy = .seconds
    static var dateFormat = "HH:mm:ss"
    
    private var timer:Timer?
    private var startDate:Date?
    private var endDate:Date?
    private var elapsedTime:TimeInterval = 0
    
    open lazy var dateFormatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    private func updateText() {
        var string:String!
        switch type {
            case .stopwatch:
                string = dateFormatter.string(from: self.elapsedTimeAsDate)
            case .countdown:
                string = dateFormatter.string(from: self.elapsedTimeAsDate)
            case .clock:
                string = dateFormatter.string(from: Date())
        }
        text = string
    }
    
    private func incrementTime() {
        self.elapsedTime += self.timeInterval
        self.updateText()
    }
    
    //MARK: - Dynamic Properties
    open var isRunning: Bool {
        get {
            if let timer = self.timer {
                return timer.isValid
            } else {
                return false
            }
        }
    }
    
    open var elapsedTimeAsDate: Date {
        get {
            return Date(timeIntervalSince1970: elapsedTime)
        }
    }
    
    private var timeInterval: TimeInterval {
        switch accurracy {
            case .seconds:
                return 1.0
            case .milliseconds:
                return 0.01
        }
    }
    
    //MARK: - Controls
    open func start() {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: self.timeInterval, repeats: true, block: { (timer) in
            self.incrementTime()
        })
        // Set Tolerance to 10% of timer, as suggested by Apple Docs
        timer?.tolerance = self.timeInterval / 10.0
        
        startDate = Date()
    }
    
    open func pause() {
        timer?.invalidate()
    }
}
