//
//  AddNewTodoFactory.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import Foundation

struct AddNewTodoFactory {
    
    func setup(coreDataManager: CoreDataManagerProtocol) -> AddNewTodoViewController {
        let view = AddNewTodoView()
        let presenter = AddNewTodoPresenter()
        let interactor = AddNewTodoInteractor(coreDataManager: coreDataManager, presenter: presenter)
        let router = AddNewTodoRouter()
        let viewController = AddNewTodoViewController(interactor: interactor, customView: view, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
