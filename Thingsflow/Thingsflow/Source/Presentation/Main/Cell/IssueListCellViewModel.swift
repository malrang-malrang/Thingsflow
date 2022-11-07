//
//  IssueListCellViewModel.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import Foundation

protocol IssueListCellViewModelable: IssueListCellViewModelOutput {}

protocol IssueListCellViewModelOutput {
    var information: String { get }
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

    var information: String {
        guard let number = self.issueInformation.number,
              let title = self.issueInformation.title else {
            return Const.unknown
        }

        return "\(number) - \(title)"
    }
}
