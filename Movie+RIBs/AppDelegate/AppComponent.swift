//
//  File.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/02.
//

import Foundation
import ModernRIBs

final class AppComponent: Component<EmptyDependency>, AppRootDependency {
    init() {
        super.init(dependency: EmptyComponent())
    }
}
