//
//  EndPoint.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation
import Alamofire

/// Server endpoint interface, any server router should implement this interface to be able to connect
protocol Endpoint {
    /// Base URL
    var domainURL: String { get }
    
    /// The last path component to the endpoint. will be appended to the base url in the service
    var serviceURL: String { get }
    
    /// Query parameters for GET requests
    var queryParameters: QueryParameters? { get }
    
    /// Body parameters for POST requests
    var bodyParameters: [String: Any]? { get }
    
    /// The HTTP headers to be appended in the request
    var headers: [String: String] { get }

    /// HTTP method as specified by the server
    var method: HTTPMethod { get }
    
    /// Determind if you want to print the response in the consol or not
    var isPrintable: Bool { get }
    
    /// Function to call requests
    func request<T: Codable>(completion: @escaping Response<T>)
}

extension Endpoint {
    var domainURL :String {
        return NetworkConstants.baseURL
    }
    
    /// Base url with serviceUrl
    var url: String {
        var urlString = domainURL + serviceURL
        if method == .get, let queryString = getQueryStringForGetRequestIfAny(){
            urlString += queryString
        }
        return urlString
    }

    var queryParameters: QueryParameters? {
        return nil
    }
    
    var bodyParameters: [String: Any]? {
        return nil
    }
        
    var headers: [String: String] {
        return [:]
    }
    
    var isPrintable: Bool {
        return true
    }
    
    private func getQueryStringForGetRequestIfAny() -> String? {
        guard let queryParameters = self.queryParameters,
              let queryString = queryParameters.queryString()
        else { return nil }
        return "?\(queryString)"
    }
    
    func request<T: Codable>(completion: @escaping Response<T>) {
        NetworkService.request(
            url: self.url,
            headers: self.headers,
            httpMethod: self.method,
            bodyParameters: self.bodyParameters,
            completion: completion
        )
    }
}

