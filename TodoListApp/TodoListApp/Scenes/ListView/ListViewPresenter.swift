//
//  ListViewPresenter.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import Foundation

protocol ListViewPresentationLogic {
    func presentView(response: ListViewModels.RequestView.Response)
    func presentError(response: String)
}

final class ListViewPresenter {
    weak var viewController: ListViewControllerDisplayLogic?
}

extension ListViewPresenter: ListViewPresentationLogic {
    func presentView(response: ListViewModels.RequestView.Response) {
        let viewModel = ListViewModels.RequestView.ViewModel(items: getAllItemsByPriority(response.items))
        viewController?.displayView(viewModel: viewModel)
    }
    
    func presentError(response: String) {
        viewController?.displayError(viewModel: response)
    }
}

extension ListViewPresenter {
    private func getAllItemsByPriority(_ items: [TodoItemModel]) -> [[TodoItemModel]] {
        TodoItemPriority.allCases.map { priority in
            items.filter { model in
                model.priority == priority
            }
        }
    }
}
