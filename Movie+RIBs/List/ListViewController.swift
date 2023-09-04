//
//  ListViewController.swift
//  Movie+RIBs
//
//  Created by 양호준 on 2023/09/04.
//

import ModernRIBs
import UIKit

protocol ListPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ListViewController: UIViewController, ListPresentable, ListViewControllable {

    weak var listener: ListPresentableListener?
}
