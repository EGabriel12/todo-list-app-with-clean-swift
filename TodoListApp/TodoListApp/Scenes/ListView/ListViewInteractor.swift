//
//  ListViewInteractor.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import Foundation

protocol ListViewBusinessLogic {
    func requestView()
}

final class ListViewInteractor {
    private let coreDataManager: CoreDataManagerProtocol
    private let presenter: ListViewPresentationLogic
    
    init(coreDataManager: CoreDataManagerProtocol, presenter: ListViewPresentationLogic) {
        self.coreDataManager = coreDataManager
        self.presenter = presenter
    }
}

extension ListViewInteractor: ListViewBusinessLogic {
    func requestView() {
        let items = getAllItems()
        
        guard !items.isEmpty else {
            return presenter.presentError(response: "Não há nenhum item.")
        }
        
        let response = ListViewModels.RequestView.Response(items: items)
        presenter.presentView(response: response)
    }
}

extension ListViewInteractor {
    private func getAllItems() -> [TodoItemModel] {
        do {
            return try coreDataManager.getAll()
        } catch {
            return []
        }
    }
}
