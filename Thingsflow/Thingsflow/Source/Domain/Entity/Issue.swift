//
//  Issue.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import Foundation

struct Issue {
    let number: String
    let title: String
    let user: [User]?
}

struct User {
    let avatarImage: String?
    let subscriptions: String?
    let nickname: String?

    private enum CodingKeys: String, CodingKey {
        case avatarImage = "avatar_url"
        case subscriptions = "subscriptions_url"
        case nickname = "node_id"
    }
}
