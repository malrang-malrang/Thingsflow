//
//  IssueListCellViewModel.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import Foundation

protocol IssueListCellViewModelable: IssueListCellViewModelOutput {}

protocol IssueListCellViewModelOutput {
    var number: String { get }
    var title: String { get }
}

private enum Const {
    static let unknown = "정보 없음"
}

final class IssueListCellViewModel: IssueListCellViewModelable {
    private let issueInformation: Issue

    init(issueInformation: Issue) {
        self.issueInformation = issueInformation
    }

    // MARK: -  Output

    var number: String {
        guard let number = self.issueInformation.number else {
            return Const.unknown
        }

        return String(number)
    }

    var title: String {
        return self.issueInformation.title ?? Const.unknown
    }
}
