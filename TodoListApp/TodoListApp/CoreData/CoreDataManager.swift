//
//  CoreDataManager.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import CoreData

protocol CoreDataManagerProtocol {
    var persistentContainer: NSPersistentContainer { get }
    init(entityName: String)
    func save(model: TodoItemModel) throws
    func getAll() throws -> [TodoItemModel]
 
    @discardableResult
    func loadPersistentStores() -> Bool
}

final class CoreDataManager: CoreDataManagerProtocol {
    let persistentContainer: NSPersistentContainer
    
    init(entityName: String) {
        persistentContainer = NSPersistentContainer(name: entityName)
    }
    
    @discardableResult
    func loadPersistentStores() -> Bool {
        var hasSuccess = true
        persistentContainer.loadPersistentStores { desc, error in
            if let error = error?.localizedDescription {
                debugPrint(error)
                hasSuccess.toggle()
            }
        }
        return hasSuccess
    }
    
    func save(model: TodoItemModel) throws {
        let entity = TodoEntity(context: persistentContainer.viewContext)
        entity.title = model.title
        entity.isFavorite = model.isFavorite
        entity.priority = model.priority.rawValue
        entity.dateCreated = model.dateCreated
        try persistentContainer.viewContext.save()
    }
    
    func getAll() throws -> [TodoItemModel] {
        let model: [TodoItemModel?] = try persistentContainer.newBackgroundContext().fetch(TodoEntity.fetchRequest()).map { todoEntity in
            if let priorityRawValue = todoEntity.priority,
               let priority = TodoItemPriority(rawValue: priorityRawValue),
               let title = todoEntity.title,
               let dateCreated = todoEntity.dateCreated {
                return TodoItemModel(
                    priority: priority,
                    title: title,
                    isFavorite: todoEntity.isFavorite,
                    dateCreated: dateCreated
                )
            }
            return nil
        }
        return model.compactMap { $0 }
    }
}
