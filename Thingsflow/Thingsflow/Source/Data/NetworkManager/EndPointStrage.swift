//
//  EndPointStrage.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import Foundation

private enum Const {
    static let baseURL = "https://api.github.com"
    static let basePath = "/repos/"
}

enum EndPointStrage {
    case issueList(text: String)
}

extension EndPointStrage {
    var endpoint: Endpoint {
        switch self {
        case .issueList(text: let text):
            return self.issueList(text: text)
        }
    }
}

extension EndPointStrage {
    private func issueList(text: String) -> Endpoint {
        return Endpoint(
            host: Const.baseURL,
            path: Const.basePath,
            queryParameters: text
        )
    }
}
