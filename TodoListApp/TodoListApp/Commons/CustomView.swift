//
//  CustomView.swift
//  TodoListApp
//
//  Created by Elias Gabriel on 23/01/23.
//

import UIKit

protocol CustomViewCodeProtocol {
    func subviews()
    func layout()
}

extension CustomViewCodeProtocol {
    func commomInit() {
        subviews()
        layout()
    }
}
