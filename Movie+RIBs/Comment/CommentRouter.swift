//
//  CommentRouter.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/04.
//

import ModernRIBs

protocol CommentInteractable: Interactable {
    var router: CommentRouting? { get set }
    var listener: CommentListener? { get set }
}

protocol CommentViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class CommentRouter: ViewableRouter<CommentInteractable, CommentViewControllable>, CommentRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: CommentInteractable, viewController: CommentViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
