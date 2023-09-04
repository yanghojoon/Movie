//
//  CommentViewController.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/04.
//

import ModernRIBs
import UIKit

protocol CommentPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class CommentViewController: UIViewController, CommentPresentable, CommentViewControllable {

    weak var listener: CommentPresentableListener?
}
