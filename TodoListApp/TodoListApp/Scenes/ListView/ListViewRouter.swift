//
//  ListViewRouter.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import UIKit

protocol ListViewRoutingLogic {
    func routerToAddNewTodo()
}

final class ListViewRouter {
    private let coreDataManager: CoreDataManagerProtocol
    var viewController: UIViewController?
    
    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
}

extension ListViewRouter: ListViewRoutingLogic {
    func routerToAddNewTodo() {
        let factory = AddNewTodoFactory()
        let destinationViewController = factory.setup(coreDataManager: coreDataManager)
        viewController?.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
