//
//  UIViewExtension.swift
//  FTLocalizationManager
//
//  Created by Abdulla Kunhi on 13/04/2020.
//

import UIKit

public extension UIView {
    func forceLeftToRight(shouldWithSuviews: Bool = false) {
        guard Language.current.isRTL else { return }
        
        if #available(iOS 13.0, *) {
            semanticContentAttribute = .forceLeftToRight
        } else {
            flip()
            if !shouldWithSuviews {
                subviews.forEach { view in
                    view.flip()
                }
            }
        }
    }
}

private extension UIView {
    func flip() {
        transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    }
}