//
//  AppRootRouter.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/02.
//

import ModernRIBs

protocol AppRootInteractable: Interactable {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting { // 처음 시작하는 Router는 LaunchRouter를 붙여야 함

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: AppRootInteractable, viewController: AppRootViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}