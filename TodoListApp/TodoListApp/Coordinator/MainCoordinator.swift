//
//  MainCoordinator.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import UIKit

final class MainCoordinator: Coordinator {
    let navigationController: UINavigationController
    let coreDataManager: CoreDataManagerProtocol
    
    required init(navigationController: UINavigationController, coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
        self.navigationController = navigationController
    }
    
    func start() {
        coreDataManager.loadPersistentStores()
        
        let factory = ListViewFactory()
        let destinationViewController = factory.setup(coreDataManager: coreDataManager)
        navigationController.pushViewController(destinationViewController, animated: true)
    }
}
