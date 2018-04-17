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
            
            let myAlert = UIAlertController(title: "알림", message: "설정된 시간이 되었습니다!!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default) { (action: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.red
            }
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: { (action: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.white
            })
            
            myAlert.addAction(okAction)
            myAlert.addAction(cancelAction)
            
            
            present(myAlert, animated: true, completion: nil)
            
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

