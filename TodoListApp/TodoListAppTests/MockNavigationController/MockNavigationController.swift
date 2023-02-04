//
//  MockNavigationController.swift
//  TodoListAppTests
//
//  Created by Elias Gabriel on 23/01/23.
//

@testable import TodoListApp
import XCTest
import UIKit

final class MockNavigationController: UINavigationController {
    var pushedVC: UIViewController?
    var popedVC: UIViewController?
    var presentedVC: UIViewController?
    var popToViewControllerCalled = false
    var popViewControllerCalled = false
    var popToRootViewControllerCalled = false
    var dismissCalled = false
    var setViewControllersCalled = false
    var setableViewControllers: [UIViewController] = []
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedVC = viewControllerToPresent
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        popedVC = viewController
        popToViewControllerCalled = true
        return nil
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        popViewControllerCalled = true
        return nil
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        popToRootViewControllerCalled = true
        return nil
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.dismissCalled = true
        super.dismiss(animated: flag, completion: completion)
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        self.setViewControllersCalled = true
        self.setableViewControllers = viewControllers
        super.setViewControllers(viewControllers, animated: animated)
    }
}
