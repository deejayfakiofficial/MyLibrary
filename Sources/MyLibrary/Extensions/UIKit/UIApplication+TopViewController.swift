//
//  UIApplication+TopViewController.swift
//  
//
//  Created by Станислав Терентьев on 27.12.2022.
//

import Foundation
import UIKit

extension UIApplication {

    public func topViewController(above controller: UIViewController? = nil) -> UIViewController? {

        let rootViewController = controller ?? self.windows.first(where: { $0.isKeyWindow })?.rootViewController

        if let navigationController = rootViewController as? UINavigationController {
            return self.topViewController(above: navigationController.visibleViewController)
        }
        if let tabController = rootViewController as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return self.topViewController(above: selected)
            }
        }
        if let presented = rootViewController?.presentedViewController {
            return self.topViewController(above: presented)
        }
        return controller
    }

}
