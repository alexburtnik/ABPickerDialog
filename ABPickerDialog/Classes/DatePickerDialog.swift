//
//  DatePickerDialog.swift
//  s9fc
//
//  Created by Alex Burtnik on 6/13/17.
//  Copyright © 2017 smartum.pro. All rights reserved.
//

import UIKit

public class DatePickerDialog: PickerDialog {
    
    public typealias DatePickerCallback = ( Date? ) -> Void
    
    private var defaultDate:    Date?
    private var datePickerMode: UIDatePickerMode?
    
    private var datePickedCallback:       DatePickerCallback?
    private var dateUpdatedCallback:       DatePickerCallback?
    
    private var datePicker = UIDatePicker()
    
    override func xibSetup() {
        super.xibSetup()
        pickerContainerView.addSubview(datePicker)
        datePicker.setupConstraints(inContainer: pickerContainerView)
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    
    open func show(title: String? = nil,
                   defaultDate: Date? = nil,
                   minimumDate: Date? = nil,
                   maximumDate: Date? = nil,
                   mode: UIDatePickerMode = .dateAndTime,
                   dateUpdated: DatePickerCallback? = nil,
                   datePicked: DatePickerCallback? = nil) {
        
        self.datePickerMode = mode
        self.datePickedCallback = datePicked
        self.dateUpdatedCallback = dateUpdated
        self.defaultDate = defaultDate
        datePicker.datePickerMode = self.datePickerMode ?? UIDatePickerMode.date
        datePicker.date = defaultDate ?? Date()
        datePicker.maximumDate = maximumDate
        datePicker.minimumDate = minimumDate
        
        super.show(title: title)
    }
    
    override func donePressed() {
        super.donePressed()
        datePickedCallback?(datePicker.date)
    }
    
    func dateChanged() {
        dateUpdatedCallback?(datePicker.date)
    }
    
}
