//
//  Repository.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 18/09/23.
//

import Foundation
import Alamofire

protocol RepositoryProtocol {
    
    func getCountries(success: @escaping (CountriesDTO.Response?) -> Void, failure: @escaping (AFError) -> Void)
    func getDetail(name: String, success: @escaping (CountryDetailDTO.Response?) -> Void, failure: @escaping (AFError) -> Void)
    func getFlag(url: String, success: @escaping (Data?) -> Void, failure: @escaping (AFError) -> Void)
    
}

class Repository: RepositoryProtocol {
    
    func getCountries(success: @escaping (CountriesDTO.Response?) -> Void, failure: @escaping (AFError) -> Void) {
        AF.request(
            CountryEndPoint.getList.path
        )
        .response() { result in
            switch result.result {
            case .success(let data):
                guard let data = data else {
                    success(nil)
                    return
                }
                let response = try? JSONDecoder().decode(CountriesDTO.Response.self, from: data)
                success(response)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func getDetail(name: String, success: @escaping (CountryDetailDTO.Response?) -> Void, failure: @escaping (AFError) -> Void) {
        AF.request(
            CountryEndPoint.getDetail(name: name).path
        )
        .response() { result in
            switch result.result {
            case .success(let data):
                do {
                    guard let data = data else {
                        success(nil)
                        return
                    }
                    let response = try JSONDecoder().decode(CountryDetailDTO.Response.self, from: data)
                    success(response)
                } catch {
                    print(error)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func getFlag(url: String, success: @escaping (Data?) -> Void, failure: @escaping (AFError) -> Void) {
        AF.request(
            url
        )
        .response() { result in
            switch result.result {
            case .success(let data):
                success(data)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
}
