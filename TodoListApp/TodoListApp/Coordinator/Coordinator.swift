//
//  Coordinator.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    var coreDataManager: CoreDataManagerProtocol { get }
    init(navigationController: UINavigationController, coreDataManager: CoreDataManagerProtocol)
    func start()
}
