//
//  AddNewTodoViewControllerTests.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 25/01/23.
//

@testable import TodoListApp
import XCTest

final class AddNewTodoViewControllerTests: XCTestCase {
    var sut: AddNewTodoViewController!
    var routerSpy: AddNewTodoRouterSpy!
    var interactorSpy: AddNewTodoItemInteractorSpy!
    var viewSpy: AddNewTodoViewConfiguration!
    
    
    override func setUp() {
        super.setUp()
        routerSpy = AddNewTodoRouterSpy()
        interactorSpy = AddNewTodoItemInteractorSpy()
        viewSpy = AddNewTodoViewSpy()
        sut = AddNewTodoViewController(interactor: interactorSpy, customView: viewSpy, router: routerSpy)
    }
    
    func testViewDidLoad() {
        sut.loadViewIfNeeded()
        
        XCTAssertEqual("Added Item", sut.title)
        XCTAssertEqual(sut.view.backgroundColor, .systemBackground)
    }
    
    func testWhenSaveButtonIsClicked() {
        sut.didTouchUpSaveButton(item: TodoItemModel(priority: .medium, title: "Clean the house", isFavorite: false, dateCreated: Date()))
        
        XCTAssertTrue(interactorSpy.addItemWasCalled)
        XCTAssertTrue(routerSpy.routerToPopWasCalled)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
