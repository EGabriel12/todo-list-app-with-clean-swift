//
//  ListViewInteractorSpy.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import Foundation
@testable import TodoListApp

final class ListViewInteractorSpy: ListViewBusinessLogic {
    var requestViewCalled = false
    
    func requestView() {
        requestViewCalled = true
    }
}
