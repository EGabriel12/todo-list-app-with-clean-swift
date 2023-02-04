//
//  ListViewControllerTests.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 23/01/23.
//

import XCTest
@testable import TodoListApp

final class ListViewControllerTests: XCTestCase {

    var sut: ListViewController!
    var routerSpy: ListViewRouterSpy!
    var interactorSpy: ListViewInteractorSpy!
    var viewSpy: ListViewSpy!
    
    override func setUp() {
        super.setUp()
        routerSpy = ListViewRouterSpy()
        interactorSpy = ListViewInteractorSpy()
        viewSpy = ListViewSpy()
        sut = ListViewController(interactor: interactorSpy, customView: viewSpy, router: routerSpy)
    }
    
    func testViewDidLoad() {
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.title, "Itens")
        XCTAssertEqual(sut.view.backgroundColor, .systemBackground)
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
    }
    
    func testViewDidAppear() {
        sut.viewDidAppear(true)
        
        XCTAssertTrue(viewSpy.updatedContentListWasCalled)
        XCTAssertTrue(interactorSpy.requestViewCalled)
    }
    
    func testDisplayView() {
        sut.displayView(viewModel: ListViewModels.RequestView.ViewModel(items: [[]]))
        
        XCTAssertTrue(viewSpy.setupWasCalled)
    }
    
    func testDisplayError() {
        sut.displayError(viewModel: "Error Message")
        
        XCTAssertTrue(viewSpy.presentErrorCalled)
    }
    
    func testPrimaryAction() {
        sut.loadViewIfNeeded()
        
        sut.primaryAction?()
        
        XCTAssertTrue(routerSpy.routerToAddNewTodoCalled)
    }
}
