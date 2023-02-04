//
//  ListViewRouterTests.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 23/01/23.
//

import XCTest
@testable import TodoListApp

final class ListViewRouterTests: XCTestCase {
    
    private var sut: ListViewRouter!
    private var coreDataManagerSpy: CoreDataManagerSpy!
    private var viewControllerSpy: ListViewControllerSpy!
    private var navigationMock: MockNavigationController!
    
    override func setUp() {
        super.setUp()
        viewControllerSpy = ListViewControllerSpy()
        coreDataManagerSpy = CoreDataManagerSpy(entityName: "fake")
        navigationMock = MockNavigationController(rootViewController: viewControllerSpy)
        sut = ListViewRouter(coreDataManager: coreDataManagerSpy)
        sut.viewController = viewControllerSpy
    }
    
    override func tearDown() {
        super.tearDown()
        coreDataManagerSpy = nil
        navigationMock = nil
        sut = nil
    }
    
    func testRouterToAddNewTodo() {
        sut.routerToAddNewTodo()
        
        XCTAssertTrue(navigationMock.pushedVC is AddNewTodoViewController)
    }
}
