//
//  IssueRepository.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import RxSwift

final class IssueRepository: IssueRepositoryProtocol {
    private let networkManager: Networkable

    init(networkManager: Networkable = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetchIssueList() -> Observable<[Issue]> {
        let endpoint = EndPointStrage.issueList.endpoint
        return self.networkManager.request(endPoint: endpoint)
            .decode(type: [Issue].self, decoder: Json.decoder)
    }
}
