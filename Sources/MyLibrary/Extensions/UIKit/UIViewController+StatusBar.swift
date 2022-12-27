//
//  UIViewController+StatusBar.swift
//  
//
//  Created by Станислав Терентьев on 27.12.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// Set status bar backgound color
    /// - Parameter color: UIColor to set
    func configureStatusBar(color: UIColor) {
        let tag = 3848245
        let keyWindow = UIApplication.shared.connectedScenes.map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.first
        if let statusBar = keyWindow?.viewWithTag(tag) {
            statusBar.backgroundColor = color
        } else {
            let height = keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
            let statusBarView = UIView(frame: height)
            statusBarView.tag = tag
            statusBarView.layer.zPosition = 999999
            keyWindow?.addSubview(statusBarView)
            statusBarView.backgroundColor = color
        }
    }
}
