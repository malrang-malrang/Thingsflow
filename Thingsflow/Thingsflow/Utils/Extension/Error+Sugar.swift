//
//  Error+Sugar.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import Foundation

extension Error {
    var identifier: String {
        if let networkError = self as? NetworkError {
            return String(describing: networkError.self)
        }

        return String(describing: Self.self)
    }

    var errorMessage: String {
        if let networkError = self as? NetworkError {
            return networkError.errorMessage
        }

        return self.localizedDescription
    }
}
