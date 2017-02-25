//
//  ViewController.swift
//  teratail_66644
//
//  Created by Kentarou on 2017/02/22.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, PickerTextFieldDelegate {
    
    @IBOutlet weak var textField1: PickerTextField!
    @IBOutlet weak var textField2: PickerTextField!
    @IBOutlet weak var textField3: PickerTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.pickerDataArray = ["AAA", "BBB", "CCC", "DDD", "EEE", "FFF", "GGG"]
        textField1.delegate = self
        
        textField2.pickerDataArray = ["111", "222", "333", "444"]
        textField2.defaultText = "333"
        textField2.delegate = self
        
        textField3.pickerDataArray = ["😳", "🙍", "🌼", "🌟"]
        textField3.pickerTextFieldDelegate = self
        textField3.delegate = self
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField === textField1 {
            textField1.defaultText = textField1.text
        } else if textField === textField2 {
            textField2.defaultText = textField2.text
        } else if textField === textField3 {
            textField3.defaultText = textField3.text
        }
        return true
    }
    
    // MARK: - PickerTextFieldDelegate
    
    func pushDoneButton(pickerTextField: PickerTextField, text: String) {
        print(text)
    }
    
    @IBAction func printPickerText(_ sender: UIButton) {
        print("textField1: \(textField1.text),textField2: \(textField2.text),textField3: \(textField3.text)")
    }
}

