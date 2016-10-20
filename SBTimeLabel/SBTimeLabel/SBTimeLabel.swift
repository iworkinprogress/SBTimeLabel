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
    open var startDate:Date?
    open var endDate:Date?
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
                string = dateFormatter.string(from: elapsedTimeAsDate)
            case .countdown:
                string = dateFormatter.string(from: elapsedTimeAsDate)
            case .clock:
                string = dateFormatter.string(from: Date())
        }
        text = string
    }
    
    private func incrementTime() {
        elapsedTime += timeInterval
        DispatchQueue.main.async() { () -> Void in
            self.updateText()
        }
    }
    
    //MARK: - Computed Properties
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
    
    open var duration:TimeInterval {
        get {
            return elapsedTime
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
        
        timer = Timer(timeInterval: self.timeInterval, repeats: true, block: { (timer) in
            self.incrementTime()
        })
        
        // Add Timer
        RunLoop.main.add(timer!, forMode: .commonModes)
        
        // Set Tolerance to 10% of timer, as suggested by Apple Docs
        timer?.tolerance = self.timeInterval / 10.0
        if startDate == nil {
            startDate = Date()
        }
    }
    
    open func pause() {
        timer?.invalidate()
        endDate = Date()
    }
    
    // Is there a difference between pause and stop
    open func stop() {
        pause()
    }
    
    open func reset() {
        stop()
        startDate = nil
        elapsedTime = 0
        self.updateText()
    }
}
