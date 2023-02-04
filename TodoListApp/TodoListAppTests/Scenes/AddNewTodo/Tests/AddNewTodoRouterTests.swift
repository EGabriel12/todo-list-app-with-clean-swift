//
//  AddNewTodoRouterTests.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 25/01/23.
//

@testable import TodoListApp
import XCTest

final class AddNewTodoRouterTests: XCTestCase {
    private var sut: AddNewTodoRouter!
    private var viewControllerSpy: AddNewTodoViewControllerSpy!
    private var navigationMock: MockNavigationController!
    
    override func setUp() {
        super.setUp()
        viewControllerSpy = AddNewTodoViewControllerSpy()
        navigationMock = MockNavigationController(rootViewController: viewControllerSpy)
        sut = AddNewTodoRouter()
        sut.viewController = viewControllerSpy
    }
    
    func testRouterToPop() {
        sut.routerToPop()
        
        XCTAssertTrue(navigationMock.popViewControllerCalled)
    }
    
    override func tearDown() {
        super.tearDown()
        viewControllerSpy = nil
        navigationMock = nil
        sut = nil
    }
    
}
