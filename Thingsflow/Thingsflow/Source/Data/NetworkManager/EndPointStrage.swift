//
//  EndPointStrage.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import Foundation

private enum Const {
    static let baseURL = "https://api.github.com"
    static let basePath = "/repos/apple/swift/issues"
}

enum EndPointStrage {
    case issueList
}

extension EndPointStrage {
    var endpoint: Endpoint {
        switch self {
        case .issueList:
            return self.issueList()
        }
    }
}

extension EndPointStrage {
    private func issueList() -> Endpoint {
        return Endpoint(host: Const.baseURL, path: Const.basePath)
    }
}
