//
//  AddNewTodoInteractor.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import Foundation

protocol AddNewTodoBusinessLogic {
    func addItem(_ item: TodoItemModel)
}

final class AddNewTodoInteractor {
    private let coreDataManager: CoreDataManagerProtocol
    private let presenter: AddNewTodoPresentationLogic
    
    init(coreDataManager: CoreDataManagerProtocol, presenter: AddNewTodoPresentationLogic) {
        self.coreDataManager = coreDataManager
        self.presenter = presenter
    }
}

extension AddNewTodoInteractor: AddNewTodoBusinessLogic {
    func addItem(_ item: TodoItemModel) {
        try? coreDataManager.save(model: item)
    }
}
