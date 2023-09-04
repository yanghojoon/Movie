//
//  AppRootComponent.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/02.
//

import ModernRIBs

// MARK: - 많아질 예정이라 따로 분리
final class AppRootComponent: Component<AppRootDependency> {
    private let rootViewController: ViewControllable
    
    init(dependency: AppRootDependency, rootViewController: ViewControllable) {
        self.rootViewController = rootViewController
        
        super.init(dependency: dependency)
    }
}

extension AppRootComponent: ListDependency, FavoriteDependency, CommentDependency { }
