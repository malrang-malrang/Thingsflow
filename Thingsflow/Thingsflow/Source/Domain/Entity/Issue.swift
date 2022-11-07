//
//  Issue.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import Foundation

struct IssueList: Decodable {
    let issueList: [Issue]?
}

struct Issue: Decodable {
    let number: String?
    let title: String?
    let user: [User]?
}
