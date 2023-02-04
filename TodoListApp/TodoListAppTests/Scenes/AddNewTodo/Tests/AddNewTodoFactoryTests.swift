//
//  AddNewTodoFactoryTests.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 25/01/23.
//

@testable import TodoListApp
import XCTest

final class AddNewTodoFactoryTests: XCTestCase {
    
    private var coreDataManagerSpy: CoreDataManagerSpy!
    
    override func setUp() {
        super.setUp()
        coreDataManagerSpy = CoreDataManagerSpy(entityName: "fake")
    }
    
    func testFactorySetup() {
        let factory = AddNewTodoFactory()
        let viewController = factory.setup(coreDataManager: coreDataManagerSpy)
        XCTAssertNotNil(viewController)
    }
    
    override func tearDown() {
        super.tearDown()
        coreDataManagerSpy = nil
    }
}
