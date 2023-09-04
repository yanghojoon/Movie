//
//  NavigationControllable.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/04.
//

import ModernRIBs
import UIKit

final class NavigationControllerable: ViewControllable {
    var uiviewController: UIViewController { self.navigationController }
    let navigationController: UINavigationController

    init(root: ViewControllable) {
        let navigationController = UINavigationController(rootViewController: root.uiviewController)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.backgroundColor = .white
        navigationController.navigationBar.scrollEdgeAppearance = navigationController.navigationBar.standardAppearance

        self.navigationController = navigationController
    }
}
