//
//  AddNewTodoRouter.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import UIKit

protocol AddNewTodoRoutingLogic {
    func routerToPop()
}

final class AddNewTodoRouter {
    var viewController: UIViewController?
}

extension AddNewTodoRouter: AddNewTodoRoutingLogic {
    func routerToPop() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
