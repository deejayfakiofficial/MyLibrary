//
//  UIViewController+PerformRoute.swift
//  
//
//  Created by Станислав Терентьев on 27.12.2022.
//

import Foundation
import PanModal
import UIKit

public extension UIViewController {
    
    func performRoute(router: Route) {
        let destinationViewController = router.configureViewController()
        switch router.presentationStyle {
        case .push:
            guard let navigationController = self.navigationController else {
                fatalError(String.init(format: "[Router] %@ has crashed due there is no any exsisting navigation controller", router.id))
            }
            if #available(iOS 14.0, *) {
                self.navigationItem.backButtonDisplayMode = .minimal
            } else {
                self.navigationItem.backBarButtonItem?.title = ""
            }
            navigationController.pushViewController(destinationViewController, animated: true)
        case .panModal:
            guard let panModalViewController = destinationViewController as? (UIViewController & PanModalPresentable) else {
                fatalError(String.init(format: "[Router] %@ has crashed due this is not panmodal presentable controller", router.id))
            }
            var modalViewController = panModalViewController
            if !(destinationViewController is UINavigationController), let targetNavigationViewController = router.navigationController(for: destinationViewController) {
                guard let targetNavigationViewController = targetNavigationViewController as? (UIViewController & PanModalPresentable) else {
                    fatalError("Navigation for \(String(describing: destinationViewController)) isn't PanModalPresentable")
                }
                modalViewController = targetNavigationViewController
            }
            modalViewController.modalPresentationStyle = .custom
            modalViewController.modalPresentationCapturesStatusBarAppearance = true
            modalViewController.transitioningDelegate = PanModalPresentationDelegate.default
            DispatchQueue.main.async {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    self.present(modalViewController, animated: true, completion: nil)
                } else {
                    self.presentPanModal(modalViewController)
                }
            }
            
        case .modal(let modalStyle):
            switch modalStyle {
            case .default:
                break
            case .fullScreen:
                destinationViewController.modalPresentationStyle = .fullScreen
            case .notSwipeable:
                destinationViewController.isModalInPresentation = true
            }
            DispatchQueue.main.async {
                self.present(destinationViewController, animated: true, completion: nil)
            }
        }
    }
}

public enum RoutePresentationStyle {
    public enum ModalStyle {
        case `default`
        case notSwipeable
        case fullScreen
    }
    case push
    case modal(ModalStyle)
    case panModal
}

public protocol Route {
    var id: String { get }
    var presentationStyle: RoutePresentationStyle { get set }
    var backButtonTitle: String? { get }
    func configureViewController() -> UIViewController
    func navigationController(for vc: UIViewController) -> UINavigationController?
}

public extension Route {
    func navigationController(for vc: UIViewController) -> UINavigationController? {
        return nil
    }
}

