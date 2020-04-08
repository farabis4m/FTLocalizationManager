//
//  UITextFieldExtensions.swift
//  LocalizationHandler
//
//  Created by Abdulla Kunhi on 4/26/18.
//  Copyright © 2018 Abdulla Kunhi. All rights reserved.
//

import UIKit

extension UITextField {
    @IBInspectable open var localizedText: String? {
        get { return valueFor(key: &localizedTextKey) }
        set {
            setValue(value: newValue, key: &localizedTextKey)
            setLocalizedText()
        }
    }
    
    @IBInspectable open var localizedPlaceholder: String? {
        get { return valueFor(key: &localizedTextKey) }
        set {
            setValue(value: newValue, key: &localizedTextKey)
            setLocalizedText()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        setLocalizedText()
        
        // flip
        if Language.current.isRTL && respectLocale  {
            if textAlignment == .right {
                textAlignment = .left
            }
            else if textAlignment == .left {
                textAlignment = .right
            }
        }
    }
    
    private func setLocalizedText() {
        if let localizedText = localizedText {
            text = &&localizedText
        }
        
        if let localizedPlaceholder = localizedPlaceholder {
            placeholder = &&localizedPlaceholder
        }
    }
}


