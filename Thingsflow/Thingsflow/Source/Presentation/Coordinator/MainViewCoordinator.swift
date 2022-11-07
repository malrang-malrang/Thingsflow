//
//  MainViewCoordinator.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import UIKit

protocol MainViewCoordinatorProtocol {}

final class MainViewCoordinator: Coordinator, MainViewCoordinatorProtocol {
    var navigationController: UINavigationController
    var parentCoordinators: Coordinator?
    var childCoordinators: [Coordinator] = []
    private let issueUseCase: IssueUseCaseProtocol

    init(
        navigationController: UINavigationController,
        parentCoordinators: Coordinator? = nil,
        childCoordinators: [Coordinator] = [],
        issueUseCase: IssueUseCaseProtocol
    ) {
        self.navigationController = navigationController
        self.parentCoordinators = parentCoordinators
        self.issueUseCase = issueUseCase
    }

    func start() {
        let mainView = MainViewController(coordinator: self)
        self.navigationController.pushViewController(mainView, animated: true)
    }
}
