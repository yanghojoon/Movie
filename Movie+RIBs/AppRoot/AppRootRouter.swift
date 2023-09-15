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
    private let listHome: ListBuildable
    private let favoriteHome: FavoriteBuildable
    private let commentHome: CommentBuildable

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
        self.listHome = list
        self.favoriteHome = favorite
        self.commentHome = comment
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    func attachTabs() {
        let listRouting = listHome.build(withListener: interactor)
        let favoriteRouting = favoriteHome.build(withListener: interactor)
        let commentRouting = commentHome.build(withListener: interactor)

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
