//
//  PickerKeyboard.swift
//  teratail_66644
//
//  Created by Kentarou on 2017/02/22.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol PickerViewTextFieldDelegate: class {
    @objc optional func pushDoneButton(text: String)
    @objc optional func pushCancelButton()
}


class PickerViewTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    weak var pickerTextFieldDelegate: PickerViewTextFieldDelegate?
    
    let pickerView = UIPickerView()
    let toolbarHeight: CGFloat = 44
    var pickerDataArray = [String]() {
        didSet {
            if let selectText = pickerDataArray.first {
                self.selectText = selectText
            }
        }
    }
    
    var selectText: String = ""
    var defaultText: String! {
        get {
            return ""
        }
        set {
            if let selectIndex = pickerDataArray.index(of: newValue) {
                pickerView.selectRow(selectIndex, inComponent: 0, animated: false)
            }
            self.text = newValue
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        pickerView.delegate   = self
        pickerView.dataSource = self
    }
    
    // 入力カーソル非表示
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    // 範囲選択カーソル非表示
    override func selectionRects(for range: UITextRange) -> [Any] {
        return []
    }
    
    // コピー・ペースト・選択等のメニュー非表示
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
    override var inputAccessoryView: UIView? {
        get {
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            toolBar.tintColor = UIColor.black
            let doneButton   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.pushDoneButton))
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.pushCancelButton))
            let spaceButton  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            toolBar.sizeToFit()
            
            return toolBar
        }
        set {}
    }
    
    override var inputView: UIView? {
        get {
            (self.value(forKeyPath: "textInputTraits") as AnyObject).setValue(UIColor.clear, forKey: "insertionPointColor")
            
            pickerView.frame = CGRect(x: 0,
                                      y: toolbarHeight,
                                      width: UIScreen.main.bounds.size.width,
                                      height: pickerView.bounds.size.height)
            pickerView.backgroundColor = UIColor.white
            return pickerView
        }
        set {}
    }
    
    // Done
    func pushDoneButton() {
        print("Done!")
        self.text = selectText
        pickerTextFieldDelegate?.pushDoneButton?(text: selectText)
        resignFirstResponder()
    }
    
    // Cancel
    func pushCancelButton() {
        print("Cancel!")
        pickerTextFieldDelegate?.pushCancelButton?()
        resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataArray[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectText = pickerDataArray[row]
    }
}
