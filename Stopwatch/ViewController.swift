//
//  ViewController.swift
//  Stopwatch
//
//  Created by D7703_17 on 2018. 4. 10..
//  Copyright © 2018년 박금상. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

      @IBOutlet weak var timeLabel: UILabel!
      var count = 0
      var myTimer = Timer()
      
      override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
       
      }
      func updateTime() {
            count = count + 1
            let min = count / 60 / 100
            let sec = (count - (min * 60 * 100)) / 100
            let msec = count - (min * 60 * 100) - (sec * 100)
            timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
      }

      @IBAction func btstart(_ sender: Any) {
            myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in
                  self.updateTime()
            })
          
      }
      
      @IBAction func btstop(_ sender: Any) {
            myTimer.invalidate()
      }
      
      @IBAction func btreset(_ sender: Any) {
            timeLabel.text = "00:00:00"
      }
}

