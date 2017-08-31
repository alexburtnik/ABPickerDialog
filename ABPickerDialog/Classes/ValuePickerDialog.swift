//
//  PickerDialog.swift
//  s9fc
//
//  Created by Alex Burtnik on 6/13/17.
//  Copyright © 2017 smartum.pro. All rights reserved.
//

import Foundation
import UIKit

public class ValuePickerDialog: PickerDialog {
    
    public typealias ValuePickerCallback = ( (Int, String) ) -> Void
    
    fileprivate var pickerView = UIPickerView()
    
    fileprivate var valuePickedCallback:       ValuePickerCallback?
    fileprivate var valueUpdatedCallback:       ValuePickerCallback?
    
    private(set) var values: [String]!
    
    override func xibSetup() {
        super.xibSetup()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerContainerView.addSubview(pickerView)
        pickerView.setupConstraints(inContainer: pickerContainerView)
    }
    
    open func show(
        title: String? = nil,
        values: [String],
        currentIndex: Int?,        
        updatedCallback: ValuePickerCallback? = nil,
        pickedCallback: ValuePickerCallback? = nil) {
        
        self.values = values
        pickerView.reloadAllComponents()
        pickerView.selectRow(currentIndex ?? 0 , inComponent: 0, animated: false)
        valuePickedCallback = pickedCallback
        valueUpdatedCallback = updatedCallback
        super.show(title: title)
    }
    
    override func donePressed() {
        super.donePressed()
        let row = pickerView.selectedRow(inComponent: 0)
        let value = values[row]
        valuePickedCallback?(row, value)
    }
    
}

extension ValuePickerDialog: UIPickerViewDelegate,UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  values?.count ?? 0
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let value = values[row]
        valueUpdatedCallback?(row, value)
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }
}


