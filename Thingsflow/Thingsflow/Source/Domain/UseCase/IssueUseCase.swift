//
//  IssueUseCase.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import RxSwift

protocol IssueUseCaseProtocol {
    func fetchIssueList(text: String) -> Observable<[Issue]>
}

final class IssueUseCase: IssueUseCaseProtocol {
    private let issueRepository: IssueRepositoryProtocol

    init(issueRepository: IssueRepositoryProtocol) {
        self.issueRepository = issueRepository
    }

    func fetchIssueList(text: String) -> Observable<[Issue]> {
        return self.issueRepository.fetchIssueList(text: text)
    }
}
