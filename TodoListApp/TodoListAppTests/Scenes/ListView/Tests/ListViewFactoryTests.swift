//
//  ListViewFactoryTests.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 23/01/23.
//

import XCTest
@testable import TodoListApp

final class ListViewFactoryTests: XCTestCase {
    func testExample() {
        let coreDataManagerSpy = CoreDataManagerSpy(entityName: "fake")
        
        let factory = ListViewFactory()
        let viewController = factory.setup(coreDataManager: coreDataManagerSpy)
        
        XCTAssertNotNil(viewController)
    }
}
