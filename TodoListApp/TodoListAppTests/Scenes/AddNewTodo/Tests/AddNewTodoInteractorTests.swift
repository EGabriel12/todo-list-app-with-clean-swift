//
//  AddNewTodoInteractorTests.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 25/01/23.
//

@testable import TodoListApp
import XCTest

final class AddNewTodoInteractorTests: XCTestCase {
    private var sut: AddNewTodoInteractor!
    private var coreDataManagerSpy: CoreDataManagerSpy!
    private var presenterSpy: AddNewTodoPresenterSpy!
    
    override func setUp() {
        super.setUp()
        
        coreDataManagerSpy = CoreDataManagerSpy(entityName: "fake")
        presenterSpy = AddNewTodoPresenterSpy()
        sut = AddNewTodoInteractor(coreDataManager: coreDataManagerSpy, presenter: presenterSpy)
    }
    
    func testWhenInteractorTriesAddAnItem() {
        sut.addItem(TodoItemModel(priority: .normal, title: "Clean the room", isFavorite: true, dateCreated: Date()))
        
        XCTAssertTrue(coreDataManagerSpy.saveWasCalled)
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
}
