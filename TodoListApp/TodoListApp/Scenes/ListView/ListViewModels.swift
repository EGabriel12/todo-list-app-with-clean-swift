//
//  ListViewModels.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import Foundation

enum ListViewModels {
    enum RequestView {
        struct Request {}
        
        struct Response {
            let items: [TodoItemModel]
        }
        
        struct ViewModel {
            let items: [[TodoItemModel]]
        }
    }
}
