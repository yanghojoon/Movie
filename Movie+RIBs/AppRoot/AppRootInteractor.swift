//
//  AppRootInteractor.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/02.
//

import Foundation
import ModernRIBs

protocol AppRootRouting: ViewableRouting {
    func attachTabs()
}

protocol AppRootPresentable: Presentable {
    var listener: AppRootPresentableListener? { get set }
}

protocol AppRootListener: AnyObject { }

final class AppRootInteractor: PresentableInteractor<AppRootPresentable>, AppRootInteractable, AppRootPresentableListener, URLHandler {
    weak var router: AppRootRouting?
    weak var listener: AppRootListener?

    override init(presenter: AppRootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()

        router?.attachTabs()
    }

    override func willResignActive() {
        super.willResignActive()
    }

    func handle(_ url: URL) { }
}
