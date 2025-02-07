//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //IBOutlets - reference to the UI elements.
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //Global var(s)
    let eggTimes : [String: Int] = [kSoft: 5, kMedium: 8, kHard: 12]
    
    var totalTime = 0
    var timePassed = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
    }
    
    //IBActions - UI events.
    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        //resetting UI and timer
        timer.invalidate()
        resetUI()
        
        //getting the btn title and it's corresponding time
        guard let btnTitle = sender.currentTitle else { return } //take btn title
        totalTime = eggTimes[btnTitle] ?? -1 //set it to it's corresponding time
        
        //Timer func
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer() {
        if timePassed < totalTime {
            timePassed += 1 ; print(timePassed)
            progressBar.progress = Float(timePassed)/Float(totalTime) //this happens when timePassed == totalTime (increment-first approach)
            
            if progressBar.progress == 1.0 {
                titleLabel.text = "Done !!"
            }
        } else {
            timer.invalidate()
            timePassed = 0
        }
    }
    
    func resetUI() {
        titleLabel.text = "How do you like your eggs?"
        progressBar.progress = 0.0
    }
}

//Finished
