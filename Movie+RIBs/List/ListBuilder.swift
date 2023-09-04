//
//  ListBuilder.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/04.
//

import ModernRIBs

protocol ListDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ListComponent: Component<ListDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ListBuildable: Buildable {
    func build(withListener listener: ListListener) -> ListRouting
}

final class ListBuilder: Builder<ListDependency>, ListBuildable {

    override init(dependency: ListDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ListListener) -> ListRouting {
        let component = ListComponent(dependency: dependency)
        let viewController = ListViewController()
        let interactor = ListInteractor(presenter: viewController)
        interactor.listener = listener
        return ListRouter(interactor: interactor, viewController: viewController)
    }
}
