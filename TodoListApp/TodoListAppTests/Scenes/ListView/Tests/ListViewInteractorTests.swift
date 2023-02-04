//
//  ListViewInteractorTests.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 23/01/23.
//

import XCTest
@testable import TodoListApp

final class ListViewInteractorTests: XCTestCase {
    
    private var sut: ListViewInteractor!
    private var coreDataManagerSpy: CoreDataManagerSpy!
    private var presenterSpy: ListViewPresenterSpy!
    
    override func setUp() {
        super.setUp()
        presenterSpy = ListViewPresenterSpy()
        coreDataManagerSpy = CoreDataManagerSpy(entityName: "fake")
        sut = ListViewInteractor(coreDataManager: coreDataManagerSpy, presenter: presenterSpy)
    }
    
    override func tearDown() {
        super.tearDown()
        presenterSpy = nil
        coreDataManagerSpy = nil
        sut = nil
    }
    
    func testRequestViewWithItems() {
        coreDataManagerSpy.getAllStub = [.init(priority: .hard, title: "title", isFavorite: true, dateCreated: Date())]
        
        sut.requestView()
        
        XCTAssertTrue(presenterSpy.presentViewCalled)
    }
    
    func testRequestViewWithoutItems() {
        coreDataManagerSpy.getAllStub = []
        
        sut.requestView()
        
        XCTAssertTrue(presenterSpy.presentErrorCalled)
    }
    
    func testRequestViewWithErrorAtCoreDataGetItems() {
        coreDataManagerSpy.hasError = true
        
        sut.requestView()
        
        XCTAssertTrue(presenterSpy.presentErrorCalled)
    }
}
