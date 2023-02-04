//
//  AddNewTodoViewControllerSpy.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 25/01/23.
//

import UIKit
@testable import TodoListApp


final class AddNewTodoViewControllerSpy: UIViewController {
    var displayViewWasCalled: Bool = false
    var didTouchUpSaveButtonWascalled: Bool = false
    
    var viewModel: TodoItemModel?
}

extension AddNewTodoViewControllerSpy: AddNewTodoControllerDisplayLogic {
    func displayView() {
        displayViewWasCalled = true
    }
}

extension AddNewTodoViewControllerSpy: AddNewTodoViewDelegate {
    func didTouchUpSaveButton(item: TodoItemModel) {
        self.viewModel = item
        didTouchUpSaveButtonWascalled = true
    }
}


