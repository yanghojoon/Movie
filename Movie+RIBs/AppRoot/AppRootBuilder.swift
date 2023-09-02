//
//  AppRootBuilder.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/02.
//

import ModernRIBs

protocol AppRootDependency: Dependency { }

// MARK: - Builder

protocol AppRootBuildable: Buildable {
    func build() -> (launchRouter: LaunchRouting, interactable: AppRootInteractable)
}

final class AppRootBuilder: Builder<AppRootDependency>, AppRootBuildable {
    override init(dependency: AppRootDependency) {
        super.init(dependency: dependency)
    }


    func build() -> (launchRouter: LaunchRouting, interactable: AppRootInteractable) {
        let tabBar = RootTabBarController()
        let component = AppRootComponent(dependency: dependency, rootViewController: tabBar) // dependency는 Builder에서 애초에 가지고 있음
        
        let interactor = AppRootInteractor(presenter: tabBar)
        let router = AppRootRouter(interactor: interactor, viewController: tabBar)
        
        return (router, interactor)
    }
}
