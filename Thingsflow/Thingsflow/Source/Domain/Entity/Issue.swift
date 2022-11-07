//
//  Issue.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import Foundation

struct Issue: Decodable {
    let number: Int?
    let title: String?
    let user: [User]?
}
