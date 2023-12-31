//
//  SceneDelegate.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/02.
//

import UIKit
import ModernRIBs

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var launchRouter: LaunchRouting?
    private var urlHandler: URLHandler?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        let appRootBuildResult = AppRootBuilder(dependency: AppComponent()).build()
        
        launchRouter = appRootBuildResult.launchRouter
        launchRouter?.launch(from: window ?? UIWindow(windowScene: windowScene)) // LaunchRouting 프로토콜에 lauch 메서드가 선언되어 있음
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

protocol URLHandler: AnyObject { // 딥링크 같은 것들 처리하는 부분같은데 일단 생성만 해놓음
  func handle(_ url: URL)
}

// !!!: 이렇게 이미 window를 keyWindow로 만들고 하는 코드가 들어가 있음
//public final func launch(from window: UIWindow) {
//    window.rootViewController = viewControllable.uiviewController
//    window.makeKeyAndVisible()
//
//    interactable.activate()
//    load()
//}
