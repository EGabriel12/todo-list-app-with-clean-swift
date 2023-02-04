//
//  ListViewController.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import UIKit

protocol ListViewControllerDisplayLogic: AnyObject {
    func displayView(viewModel: ListViewModels.RequestView.ViewModel)
    func displayError(viewModel: String)
}

final class ListViewController: UIViewController {
    
    private let customView: ListViewConfiguration
    private let interactor: ListViewBusinessLogic
    private let router: ListViewRoutingLogic
    
    var primaryAction: (() -> Void)?
    
    init(interactor: ListViewBusinessLogic, customView: ListViewConfiguration, router: ListViewRoutingLogic) {
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Itens"
        view.backgroundColor = .systemBackground
        addIncludeTodoButtonIntoNavigationItem()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor.requestView()
        customView.updatedContentList()
    }
    
    private func addIncludeTodoButtonIntoNavigationItem() {
        primaryAction = { [self] in
            router.routerToAddNewTodo()
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: UIAction(handler: { [self] _ in
            primaryAction?()
        }))
    }
}

extension ListViewController: ListViewControllerDisplayLogic {
    func displayView(viewModel: ListViewModels.RequestView.ViewModel) {
        customView.setup(viewModel: viewModel)
    }
    
    func displayError(viewModel: String) {
        customView.presentError(message: viewModel)
    }
}
