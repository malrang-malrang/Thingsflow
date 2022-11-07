//
//  IssueRepositoryProtocol.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import RxSwift

protocol IssueRepositoryProtocol {
    func fetchIssueList(text: String) -> Observable<[Issue]>
}
