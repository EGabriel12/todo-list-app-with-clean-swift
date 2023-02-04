//
//  AddNewTodoController.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import UIKit

protocol AddNewTodoControllerDisplayLogic: AnyObject {
    func displayView()
}

final class AddNewTodoViewController: UIViewController {
    
    private let customView: AddNewTodoViewConfiguration
    private let interactor: AddNewTodoBusinessLogic
    private let router: AddNewTodoRoutingLogic
    
    init(interactor: AddNewTodoBusinessLogic, customView: AddNewTodoViewConfiguration, router: AddNewTodoRoutingLogic) {
        self.interactor = interactor
        self.customView = customView
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = customView
        customView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Added Item"
        view.backgroundColor = .systemBackground
    }
}

extension AddNewTodoViewController: AddNewTodoControllerDisplayLogic {
    func displayView() {
        
    }
}

extension AddNewTodoViewController: AddNewTodoViewDelegate {
    func didTouchUpSaveButton(item: TodoItemModel) {
        interactor.addItem(item)
        router.routerToPop()
    }
}
