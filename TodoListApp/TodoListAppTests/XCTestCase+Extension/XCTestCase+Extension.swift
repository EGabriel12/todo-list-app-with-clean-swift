//
//  XCTestCase+Extension.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 23/01/23.
//

import XCTest

enum XCTestError: Error {
    case failedToUnwrapping
    case failedToCast
}

extension XCTestCase {
    func cast<T, K>(from: T, to: K.Type) throws -> K {
        if let value = from as? K {
            return value
        }
        throw XCTestError.failedToCast
    }
}
