//
//  ListViewPresenterTests.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 23/01/23.
//

import XCTest
@testable import TodoListApp

final class ListViewPresenterTests: XCTestCase {
    
    private var sut: ListViewPresenter!
    private var viewControllerSpy: ListViewControllerSpy!
    
    override func setUp() {
        super.setUp()
        viewControllerSpy = ListViewControllerSpy()
        sut = ListViewPresenter()
        sut.viewController = viewControllerSpy
    }
    
    override func tearDown() {
        super.tearDown()
        viewControllerSpy = nil
        sut = nil
    }
    
    func testPresentViewWithItems() {
        let response = ListViewModels.RequestView.Response(items: [.init(priority: .hard, title: "title", isFavorite: true, dateCreated: Date())])
        
        sut.presentView(response: response)
        
        XCTAssertTrue(viewControllerSpy.displayViewCalled)
    }
    
    func testIfPresentViewFillsViewModel() {
        let response = ListViewModels.RequestView.Response(items: [.init(priority: .hard, title: "Do the Laundry", isFavorite: true, dateCreated: Date()), .init(priority: .hard, title: "Clean the house", isFavorite: true, dateCreated: Date())])
        sut.presentView(response: response)
        
        
        XCTAssertNotNil(viewControllerSpy.viewModel)
        XCTAssertEqual(viewControllerSpy.viewModel?.items.last?.first?.priority.color, .red)
        XCTAssertTrue(viewControllerSpy.viewModel?.items[2].count == 2)
    }
    
    func testPresentError() {
        sut.presentError(response: "message error")
        
        XCTAssertTrue(viewControllerSpy.displayErrorCalled)
    }
}
