//
//  MainCoordinatorTests.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 23/01/23.
//

@testable import TodoListApp
import XCTest

final class MainCoordinatorTests: XCTestCase {
    
    var sut: MainCoordinator!
    var mockNavigationController: MockNavigationController!
    var coreDataManagerSpy: CoreDataManagerSpy!
    
    override func setUp() {
        super.setUp()
        mockNavigationController = MockNavigationController()
        coreDataManagerSpy = CoreDataManagerSpy(entityName: "entity_mocked")
        sut = MainCoordinator(navigationController: mockNavigationController, coreDataManager: coreDataManagerSpy)
    }
    
    func testStart() {
        sut.start()
        
        XCTAssertTrue(coreDataManagerSpy.loadPersistentStoresWasCalled)
        let viewController = try? cast(from: mockNavigationController.pushedVC, to: ListViewController.self)
        XCTAssertNotNil(viewController)
    }
}
