//
//  HttpMethod.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"

    var value: String {
        return self.rawValue
    }
}
