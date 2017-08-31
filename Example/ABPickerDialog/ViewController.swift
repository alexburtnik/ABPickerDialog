//
//  ViewController.swift
//  ABPickerDialog
//
//  Created by sv on 08/30/2017.
//  Copyright (c) 2017 sv. All rights reserved.
//

import UIKit
import ABPickerDialog

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let title = NSLocalizedString("Country of birth", comment: "Edit info")
        
        CountryPickerDialog().show(title: title, currentCode: "us") { code in
            print("picked country with code: \(code)")
        }
    }
}

