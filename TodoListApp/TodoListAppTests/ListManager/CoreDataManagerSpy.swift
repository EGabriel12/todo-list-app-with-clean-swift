//
//  CoreDataManagerSpy.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 23/01/23.
//

import CoreData
@testable import TodoListApp

final class CoreDataManagerSpy {
    var loadPersistentStoresStub = false
    var saveStub: TodoItemModel?
    var hasError = false
    var getAllStub: [TodoItemModel] = []
    
    var loadPersistentStoresWasCalled = false
    var saveWasCalled = false
    var getAllWasCalled = false
    
    let persistentContainer: NSPersistentContainer
    
    init(entityName: String) {
        persistentContainer = NSPersistentContainer(name: entityName)
    }
}

extension CoreDataManagerSpy: CoreDataManagerProtocol {
    func loadPersistentStores() -> Bool {
        loadPersistentStoresWasCalled = true
        return loadPersistentStoresStub
    }
    
    func save(model: TodoItemModel) throws {
        if hasError {
            throw NSError(domain: "domain", code: -1200)
        } else {
            saveWasCalled = true
            saveStub = model
        }
    }
    
    func getAll() throws -> [TodoItemModel] {
        if hasError {
            throw NSError(domain: "domain", code: -1200)
        } else {
            getAllWasCalled = true
            return getAllStub
        }
    }
}
