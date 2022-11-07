//
//  MainViewModel.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import RxSwift
import RxRelay

protocol MainViewModelable: MainViewModelInput, MainViewModelOutput {}

protocol MainViewModelInput {
    func fetchIssueList(text: String)
}

protocol MainViewModelOutput {
    var error: Observable<Error> { get }
    var issueList: Observable<[Issue]> { get }
    var issueTitle: Observable<String> { get }
}

final class MainViewModel: MainViewModelable {
    private let errorRelay = PublishRelay<Error>()
    private let issueListRelay = PublishRelay<[Issue]>()
    private let issueTitleRelay = PublishRelay<String>()
    private let issueUseCase: IssueUseCaseProtocol
    private let disposeBag = DisposeBag()

    init(issueUseCase: IssueUseCaseProtocol) {
        self.issueUseCase = issueUseCase
    }

    // MARK: - Input

    func fetchIssueList(text: String) {
        self.issueUseCase.fetchIssueList(text: text)
            .subscribe(onNext: { [weak self] issueList in
                self?.issueListRelay.accept(issueList)
                self?.issueTitleRelay.accept(text)
            }, onError: { [weak self] error in
                self?.errorRelay.accept(error)
            })
            .disposed(by: self.disposeBag)
    }

    // MARK: - Output

    var error: Observable<Error> {
        return self.errorRelay.asObservable()
    }

    var issueList: Observable<[Issue]> {
        return self.issueListRelay.asObservable()
    }

    var issueTitle: Observable<String> {
        return self.issueTitleRelay.asObservable()
    }
}
