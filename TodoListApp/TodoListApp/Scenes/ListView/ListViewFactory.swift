//
//  ListViewFactory.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import Foundation

struct ListViewFactory {
    
    func setup(coreDataManager: CoreDataManagerProtocol) -> ListViewController {
        let view = ListView()
        let presenter = ListViewPresenter()
        let interactor = ListViewInteractor(coreDataManager: coreDataManager, presenter: presenter)
        let router = ListViewRouter(coreDataManager: coreDataManager)
        let viewController = ListViewController(interactor: interactor, customView: view, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
