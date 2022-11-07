//
//  Requestable.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import Foundation

protocol Requestable {
    var host: String { get }
    var path: String { get }
    var method: HttpMethod { get }
    var queryParameters: String { get }
}

extension Requestable {
    func generateUrlRequest() -> Result<URLRequest, NetworkError> {
        var urlRequest: URLRequest

        switch self.generateURL() {
        case.success(let url):
            urlRequest = URLRequest(url: url)
        case.failure(let error):
            return .failure(error)
        }

        urlRequest.httpMethod = self.method.value

        return .success(urlRequest)
    }

    private func generateURL() -> Result<URL, NetworkError> {
        let fullPath = "\(self.host)\(self.path)\(self.queryParameters)"

        guard let urlComponent = URLComponents(string: fullPath) else {
            return .failure(.urlComponetError)
        }

        guard let url = urlComponent.url else {
            return .failure(.urlError)
        }
        
        return .success(url)
    }
}
