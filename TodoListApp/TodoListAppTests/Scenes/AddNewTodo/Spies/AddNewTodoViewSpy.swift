//
//  AddNewTodoViewSpy.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 24/01/23.
//

import UIKit
@testable import TodoListApp


final class AddNewTodoViewSpy: UIView {
    var delegate: AddNewTodoViewDelegate?
    var getNumberOfRowsInComponentsWasCalled: Bool = false
    var getTitleForRowWasCalled: Bool = false
    var getSelectedTitleForRowWasCalled: Bool = false
}

extension AddNewTodoViewSpy: AddNewTodoViewConfiguration {
    func getNumberOfRowsInComponents() -> Int {
        getNumberOfRowsInComponentsWasCalled = true
        return 0
    }
    
    func getTitleForRow(row: Int) -> String {
        getTitleForRowWasCalled = true
        return ""
    }
    
    func getSelectedTitleForRow(row: Int) -> String {
        getSelectedTitleForRowWasCalled = true
        return ""
    }
}
