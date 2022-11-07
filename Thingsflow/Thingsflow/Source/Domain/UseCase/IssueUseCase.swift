//
//  IssueUseCase.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import RxSwift

protocol IssueUseCaseProtocol {
    func fetchIssueList() -> Observable<[Issue]>
}

final class IssueUseCase: IssueUseCaseProtocol {
    private let IssueRepository: IssueRepositoryProtocol

    init(IssueRepository: IssueRepositoryProtocol) {
        self.IssueRepository = IssueRepository
    }

    func fetchIssueList() -> Observable<[Issue]> {
        return self.IssueRepository.fetchIssueList()
    }
}
