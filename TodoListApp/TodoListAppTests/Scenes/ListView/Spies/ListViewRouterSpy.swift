//
//  ListViewRouterSpy.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import Foundation

@testable import TodoListApp

final class ListViewRouterSpy: ListViewRoutingLogic {
   
    var routerToAddNewTodoCalled = false
    
    func routerToAddNewTodo() {
        routerToAddNewTodoCalled = true
    }
}
