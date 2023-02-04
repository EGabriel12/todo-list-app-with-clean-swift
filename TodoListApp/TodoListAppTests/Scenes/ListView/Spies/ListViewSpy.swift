//
//  ListViewSpy.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import UIKit
@testable import TodoListApp

final class ListViewSpy: UIView {
    var items: [[TodoItemModel]] = [[]]
    
    var numberOfRowsInSegmentWasCalled: Bool = false
    var updatedContentListWasCalled: Bool = false
    var makeAccessoryViewWasCalled: Bool = false
    var makeCellWasCalled: Bool = false
    var setupWasCalled: Bool = false
    var presentErrorCalled: Bool = false
    
}

extension ListViewSpy: ListViewConfiguration {
    func numberOfRowsInSegment() -> Int {
        numberOfRowsInSegmentWasCalled = true
        return 0
    }
    
    func updatedContentList() {
        updatedContentListWasCalled = true
    }
    
    func makeAccessoryView(image: UIImage?) -> UIImageView {
        makeAccessoryViewWasCalled = true
        return UIImageView()
    }
    
    func makeCell(indexPath: IndexPath) -> UITableViewCell {
        makeCellWasCalled = true
        return UITableViewCell()
    }
    
    func setup(viewModel: ListViewModels.RequestView.ViewModel) {
        setupWasCalled = true
    }
        
    func presentError(message: String) {
        presentErrorCalled = true
    }
}
