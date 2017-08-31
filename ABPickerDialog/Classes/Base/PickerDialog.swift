//
//  DatePickerDialog.swift
//  s9fc
//
//  Created by Alex Burtnik on 6/13/17.
//  Copyright © 2017 smartum.pro. All rights reserved.
//

import UIKit

public class PickerDialog: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var dialogView: UIView!
    @IBOutlet var pickerContainerView: UIView!
    @IBOutlet var headerView: UIView!
    
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var cancelButton: UIButton!
    @IBOutlet public var doneButton: UIButton!

    @IBOutlet var dialogBottomConstraint: NSLayoutConstraint!
    
    public dynamic var headerColor: UIColor? { didSet { update() } }
    public dynamic var titleFont: UIFont? { didSet { update() } }
    public dynamic var buttonsFont: UIFont? { didSet { update() } }
    
    public var showCancelButton:Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func localize() {
        cancelButton.setTitle(NSLocalizedString("Cancel", comment: ""), for: .normal)
        doneButton.setTitle(NSLocalizedString("Done", comment: ""), for: .normal)
    }
    
    func xibSetup() {
        let bundle = Bundle(for: PickerDialog.self)
        let nib = UINib(nibName: "PickerDialog", bundle: bundle)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(view)

        self.view.setupConstraints(inContainer: self)
        
        backgroundColor = UIColor.clear
        localize()
    }
    
    open func show(title: String? = nil) {
        updateAppearance()
        
        titleLabel.text = title
    
        guard let appDelegate = UIApplication.shared.delegate else { fatalError() }
        guard let window = appDelegate.window else { fatalError() }
        window!.addSubview(self)
        window!.endEditing(true)
       
        self.frame = window!.bounds
        show(false, animated: false)
        show(true, animated: true)
    }
    
    func updateAppearance() {
        tintColor = PickerDialog.appearance().tintColor
        titleFont = PickerDialog.appearance().titleFont
        buttonsFont = PickerDialog.appearance().buttonsFont
        update()
    }
    
    func update() {
        titleLabel.font = titleFont
        titleLabel.textColor = tintColor
        
        cancelButton.titleLabel?.font = buttonsFont
        doneButton.titleLabel?.font = buttonsFont
        
        cancelButton.setTitleColor(tintColor, for: .normal)
        doneButton.setTitleColor(tintColor, for: .normal)
        if headerColor != nil {
            headerView.backgroundColor = headerColor
        }
        
    }
    
    private func show(_ shown: Bool, animated: Bool, completion: (() -> Void)? = nil) {
        dialogBottomConstraint.constant = shown ? 0 : -dialogView.bounds.size.height
        UIView.animateIfNeeded(withDuration: animated ? 0.3 : 0,
                               animations: {
                                self.backgroundView.alpha = shown ? 1 : 0
                                self.layoutIfNeeded()
        },
                               completion: completion )
    }
    
    func hide(animated: Bool, completion: (() -> Void)? = nil) {
        show(false, animated: animated) {
            self.removeFromSuperview()
        }
    }
    
    
    @IBAction func cancelPressed() {
        hide(animated: true)
    }
    
    @IBAction func donePressed() {
        hide(animated: true)
    }

}

extension UIView {
    
    func setupConstraints(inContainer container: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: NSLayoutFormatOptions.alignAllCenterY , metrics: nil, views: ["view": self]))
        container.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: NSLayoutFormatOptions.alignAllCenterX , metrics: nil, views: ["view": self]))
    }
    
    static func animateIfNeeded(withDuration duration: TimeInterval, animations: @escaping ()->Void, completion: (()->Void)? = nil) {
        if duration > 0 {
            self.animate(withDuration: duration, animations: animations, completion: { _ in completion?() })
        }
        else {
            animations()
            completion?()
        }
        
    }
}
