//
//  BaseView.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import UIKit

class BaseView: UIView & CustomViewCodeProtocol {
    
    init() {
        super.init(frame: .zero)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func subviews() { }
    
    func layout() { }
}
