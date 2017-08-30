//
//  CountryPickerDialog.swift
//  s9fc
//
//  Created by Alex Burtnik on 6/14/17.
//  Copyright © 2017 smartum.pro. All rights reserved.
//

import UIKit

class CountryPickerDialog: ValuePickerDialog {

    public typealias CountryPickerCallback = ( String? ) -> Void
    
    func show(
        title: String? = nil,
        currentCode: String? = nil,
        updatedCallback: CountryPickerCallback? = nil,
        pickedCallback: CountryPickerCallback? = nil) {
        
        let values = NSLocale.isoCountryCodes
        let currentIndex = currentCode != nil ? values.index(of: currentCode!) : nil
        
        super.show(title: title,
                   values: values,
                   currentIndex: currentIndex,
                   updatedCallback: { row, value in
                    updatedCallback?(value)
        },
                   pickedCallback: { row, value in
                    pickedCallback?(value)
        })
    }
    
    override func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryWithCode(values[row])
    }
    
    private func countryWithCode(_ code: String?) -> String? {
        guard let code = code else { return nil }
        return NSLocale(localeIdentifier: preferredLocale()).localizedString(forCountryCode: code)
    }
    
    private func preferredLocale() -> String {
        return Bundle.main.preferredLocalizations.first ?? "en"
    }


}
