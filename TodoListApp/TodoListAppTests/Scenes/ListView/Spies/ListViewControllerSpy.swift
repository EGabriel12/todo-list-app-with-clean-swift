//
//  ListViewControllerSpy.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import UIKit
@testable import TodoListApp

final class ListViewControllerSpy: UIViewController, ListViewControllerDisplayLogic {
    
    var displayViewCalled = false
    var displayErrorCalled = false
    
    var viewModel: TodoListApp.ListViewModels.RequestView.ViewModel?
    
    func displayView(viewModel: TodoListApp.ListViewModels.RequestView.ViewModel) {
        self.viewModel = viewModel
        displayViewCalled = true
    }
    
    func displayError(viewModel: String) {
        displayErrorCalled = true
    }
}
