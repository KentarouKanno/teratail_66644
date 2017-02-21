//
//  ViewController.swift
//  teratail_66644
//
//  Created by Kentarou on 2017/02/22.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField1: PickerViewTextField!
    @IBOutlet weak var textField2: PickerViewTextField!
    @IBOutlet weak var textField3: PickerViewTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.pickerDataArray = ["AAA", "BBB", "CCC", "DDD", "EEE", "FFF", "GGG"]
        
        textField2.pickerDataArray = ["111", "222", "333", "444"]
        
        textField3.pickerDataArray = ["😳", "🙍", "🌼", "🌟"]
    }
}

