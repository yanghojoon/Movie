//
//  AppRootViewController.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/02.
//

import ModernRIBs
import UIKit

protocol AppRootPresentableListener: AnyObject { }

final class RootTabBarController: UITabBarController, AppRootPresentable, AppRootViewControllable {
    weak var listener: AppRootPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
    }

    func setViewControllers(_ viewControllables: [ViewControllable]) {
        super.setViewControllers(viewControllables.map(\.uiviewController), animated: false)
    }
}
