//
//  AddNewTodoInteractorSpy.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 25/01/23.
//

@testable import TodoListApp

final class AddNewTodoItemInteractorSpy: AddNewTodoBusinessLogic {
    var addItemWasCalled: Bool = false
    
    func addItem(_ item: TodoItemModel) {
        addItemWasCalled = true
    }
}
