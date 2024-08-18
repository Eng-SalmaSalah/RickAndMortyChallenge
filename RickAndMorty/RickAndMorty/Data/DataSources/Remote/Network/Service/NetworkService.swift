//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation
import Alamofire

typealias Response<T: Codable> = (Result<ResponseDTO<T>, Error>) -> Void

class NetworkService {
    static func request<T: Codable>(url: String,
                                    headers: [String:String] = [:],
                                    httpMethod: HTTPMethod,
                                    bodyParameters: [String: Any]?,
                                    completion: @escaping (Result<ResponseDTO<T>, Error>) -> Void) {
        
        guard let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedURL) else {
            print("❌ Network Service: Not Valid URL: \(url.description)")
            return
        }
        
        NetworkPrintHelper.logNetwork(
               """
               🙇‍♂️ \(httpMethod.rawValue.uppercased()) '\(url)':
               📝 Request headers = \(headers)
               📝 Request Body = \(String(describing: bodyParameters))
               """
        )
        
        guard let networkReachabilityManager = NetworkReachabilityManager(),
              networkReachabilityManager.isReachable else {
            completion(.failure(AppError.rechabilityError(message: "connectionErrorAlertMessage".localized)))
            return
        }
        
        AF.request(url,
                   method: httpMethod,
                   parameters: bodyParameters,
                   encoding: JSONEncoding.default,
                   headers: HTTPHeaders(headers)).responseData { response in
            handleResponse(response: response, completion: completion)
        }
    }
    
    private static func handleResponse<T: Codable>(response: AFDataResponse<Data>, completion: @escaping (Result<ResponseDTO<T>, Error>) -> Void) {
        switch response.result {
        case .success(let data):
            NetworkPrintHelper.printRawResponse(data: data)
            do {
                let decodedData = try JSONDecoder().decode(ResponseDTO<T>.self, from: data)
                completion(.success(decodedData))
            } catch {
                do {
                    let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                    completion(.failure(AppError.serverError(message: errorResponse.error,
                                                             errorCode: "\(errorResponse.status)")))
                } catch {
                    completion(.failure(error))
                }
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
