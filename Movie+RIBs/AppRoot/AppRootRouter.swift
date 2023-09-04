//
//  AppRootRouter.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/02.
//

import ModernRIBs

protocol AppRootInteractable: Interactable, ListListener, FavoriteListener, CommentListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    func setViewControllers(_ viewControllers: [ViewControllable])
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting { // 처음 시작하는 Router는 LaunchRouter를 붙여야 함
    private let list: ListBuildable
    private let favorite: FavoriteBuildable
    private let comment: CommentBuildable

    private var listRouting: ViewableRouting?
    private var favoriteRouting: ViewableRouting?
    private var commentRouting: ViewableRouting?

    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        list: ListBuildable,
        favorite: FavoriteBuildable,
        comment: CommentBuildable
    ) {
        self.list = list
        self.favorite = favorite
        self.comment = comment
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    func attachTabs() {
        let listRouting = list.build(withListener: interactor)
        let favoriteRouting = favorite.build(withListener: interactor)
        let commentRouting = comment.build(withListener: interactor)

        attachChilds([
            listRouting,
            favoriteRouting,
            commentRouting
        ])

        let viewControllers = [
            NavigationControllerable(root: listRouting.viewControllable),
            NavigationControllerable(root: favoriteRouting.viewControllable),
            NavigationControllerable(root: commentRouting.viewControllable)
        ]

        viewController.setViewControllers(viewControllers)
    }
    
    private func attachChilds(_ routings: [ViewableRouting]) {
        routings.forEach { attachChild($0) }
    }
}
