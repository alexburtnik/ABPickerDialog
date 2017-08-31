//
//  YearPickerDialog.swift
//  s9fc
//
//  Created by Alex Burtnik on 6/13/17.
//  Copyright © 2017 smartum.pro. All rights reserved.
//

import UIKit

public class YearPickerDialog: ValuePickerDialog {
    
    public typealias YearPickerCallback = ( Int? ) -> Void
    
    public func show(
        title: String? = nil,
        min: Int? = nil,
        max: Int? = nil,
        currentYear: Int?,
        updatedCallback: YearPickerCallback? = nil,
        pickedCallback: YearPickerCallback? = nil) {
        
        let years = Array((min ?? 1950)...(max ?? 2050))
        let stringValues = years.map{"\($0)"}
        let currentIndex = currentYear != nil ? years.index(of: currentYear!) : nil
        
        super.show(title: title,
                   values: stringValues,
                   currentIndex: currentIndex,
                   updatedCallback: { row, value in
                    updatedCallback?(Int(value))
        },
                   pickedCallback: { row, value in
                    pickedCallback?(Int(value))
        })
    }

}
