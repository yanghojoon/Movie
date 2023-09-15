//
//  CommentInteractor.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/04.
//

import ModernRIBs

protocol CommentRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CommentPresentable: Presentable {
    var listener: CommentPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol CommentListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class CommentInteractor: PresentableInteractor<CommentPresentable>, CommentInteractable, CommentPresentableListener {

    weak var router: CommentRouting?
    weak var listener: CommentListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: CommentPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
