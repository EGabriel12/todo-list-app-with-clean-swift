//
//  ListViewPresenterSpy.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import UIKit
@testable import TodoListApp

final class ListViewPresenterSpy: ListViewPresentationLogic {
    var presentViewCalled = false
    var presentErrorCalled = false
    
    func presentView(response: TodoListApp.ListViewModels.RequestView.Response) {
        presentViewCalled = true
    }
    
    func presentError(response: String) {
        presentErrorCalled = true
    }
}
