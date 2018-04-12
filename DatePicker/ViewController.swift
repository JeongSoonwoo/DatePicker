//
//  ViewController.swift
//  DatePicker
//
//  Created by 정순우 on 2018. 4. 12..
//  Copyright © 2018년 정순우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var myTimer = Timer()
    var number : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time.text = formatter.string(from: datePicker.date)
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
    }
    
    func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_MM-dd HH:mm:ss"
        currentTimeLabel.text = formatter.string(from: date)
        
        if currentTimeLabel.text == time.text {
            view.backgroundColor = UIColor.red
        }else {
            view.backgroundColor = UIColor.white
        }
}
    
    @IBAction func changeDatePicker(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_MM-dd HH:mm:ss"
        time.text = formatter.string(from: datePicker.date)
    }
}

