//
//  ViewController.swift
//  ABPickerDialogDemo
//
//  Created by Alex Burtnik on 8/30/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let title = NSLocalizedString("Country of birth", comment: "Edit info")
        CountryPickerDialog().show(title: title) { code in
            print("picked country with code: \(code)")
        }
    }
}

