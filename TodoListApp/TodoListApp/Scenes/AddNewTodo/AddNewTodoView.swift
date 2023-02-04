//
//  AddNewTodoView.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import UIKit

protocol AddNewTodoViewConfiguration: UIView {
    var delegate: AddNewTodoViewDelegate? { get set }
    func getNumberOfRowsInComponents() -> Int
    func getTitleForRow(row: Int) -> String
    func getSelectedTitleForRow(row: Int) -> String
}

protocol AddNewTodoViewDelegate: AnyObject {
    func didTouchUpSaveButton(item: TodoItemModel)
}

final class AddNewTodoView: BaseView {
    
    // MARK: - Properties
    weak var delegate: AddNewTodoViewDelegate?
    
    // MARK: - UI
    private lazy var contentStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleTextField, priorityStackView, isFavoriteStackView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 16
        return view
    }()

    private lazy var titleTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Insert here"
        view.borderStyle = .roundedRect
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priorityStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [priorityLabel, priorityTextField])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    private lazy var priorityLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Priority: "
        return view
    }()
    
    private lazy var priorityPickerView: UIPickerView = {
        let view = UIPickerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private lazy var priorityTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Input here"
        view.inputView = priorityPickerView
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var isFavoriteStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [isFavoriteLabel, isFavoriteSwitch])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    private lazy var isFavoriteLabel: UILabel = {
        let view = UILabel()
        view.text = "Is Favorite: "
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var isFavoriteSwitch: UISwitch = {
        let control = UISwitch()
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(configuration: .bordered(), primaryAction: UIAction(handler: didTouchUpSaveButton))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        return button
    }()
    
    // MARK: - CustomViewCodeProtocol
    override func subviews() {
        addSubview(contentStackView)
        addSubview(saveButton)
    }
    
    override func layout() {
        addConstraints([
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            saveButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - UIResponder
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        endEditing(true)
    }
    
    private func didTouchUpSaveButton(_ action: UIAction) -> Void {
        if let title = titleTextField.text,
           let priorityRawValue = priorityTextField.text,
           let priority = TodoItemPriority(rawValue: priorityRawValue) {
            delegate?.didTouchUpSaveButton(
                item: TodoItemModel(
                    priority: priority,
                    title: title,
                    isFavorite: isFavoriteSwitch.isOn,
                    dateCreated: Date()
                )
            )
        }
    }
}

// MARK: - ListViewConfiguration
extension AddNewTodoView: AddNewTodoViewConfiguration {
    func getSelectedTitleForRow(row: Int) -> String {
        TodoItemPriority.allCases[row].rawValue
    }
    
    func getTitleForRow(row: Int) -> String {
        TodoItemPriority.allCases[row].rawValue
    }
    
    
    func getNumberOfRowsInComponents() -> Int {
        TodoItemPriority.allCases.count
    }
}


// MARK: - UIPickerViewDataSource
extension AddNewTodoView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        getNumberOfRowsInComponents()
    }
}

// MARK: - UIPickerViewDataSUIPickerViewDelegateource
extension AddNewTodoView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        getTitleForRow(row: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        priorityTextField.text = getSelectedTitleForRow(row: row)
    }
}
