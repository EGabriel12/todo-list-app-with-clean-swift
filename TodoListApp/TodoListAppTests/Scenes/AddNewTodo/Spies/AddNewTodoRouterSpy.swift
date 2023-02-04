//
//  AddNewTodoRouterSpy.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 25/01/23.
//

@testable import TodoListApp

final class AddNewTodoRouterSpy: AddNewTodoRoutingLogic {
    var routerToPopWasCalled: Bool = false
    
    func routerToPop() {
        routerToPopWasCalled = true
    }
}
