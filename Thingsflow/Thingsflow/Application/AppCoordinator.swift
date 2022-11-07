//
//  AppCoordinator.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var parentCoordinators: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
}

extension Coordinator {
    func removeChild(_ coordinator: Coordinator) {
        self.childCoordinators.removeAll()
    }
}

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinators: Coordinator?
    var childCoordinators: [Coordinator] = []
    private let issueUseCase = IssueUseCase(issueRepository: IssueRepository())

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let mainCoordinator = MainViewCoordinator(
            navigationController: self.navigationController,
            parentCoordinators: self,
            issueUseCase: self.issueUseCase
        )
        self.childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
}
