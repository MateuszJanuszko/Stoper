//
//  ViewController.swift
//  Stoper
//
//  Created by Mateusz Januszko on 01/05/2019.
//  Copyright © 2019 Mateusz Januszko. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var previousTimeLabel: UILabel!
    
    var timer: Timer?
    var isStarted = false
    var counter = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @objc func updateTimeLabel() {
        counter += 0.1
        timeLabel.text = String(round(counter*10)/10)
        
    }
    
    @IBAction func startStopAction(_ sender: UIButton) {
        
        if isStarted {
            timer?.invalidate()
            isStarted = false
            startStopButton.setTitle("Start", for: .normal)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
            isStarted = true
            startStopButton.setTitle("Stop", for: .normal)
            
        }
        
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        counter = 0.0
        timeLabel.text = "0.0"
        if isStarted {
            timer?.invalidate()
            startStopButton.setTitle("Start", for: .normal)
            isStarted = false
        }
    }
    
    @IBAction func newLapAction(_ sender: UIButton) {
        
        if isStarted == true {
            previousTimeLabel.text = String(round(counter*10)/10)
            counter = 0.0
            timeLabel.text = "0.0"

        } else if isStarted == false {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
            isStarted = true
            
        }
            
        }
    
    
}

