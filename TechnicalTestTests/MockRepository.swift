//
//  MockRepository.swift
//  TechnicalTestTests
//
//  Created by Alexander Rodriguez on 18/09/23.
//

import Foundation
import Alamofire
@testable import TechnicalTest

class MockRepository: RepositoryProtocol {
    
    var mockCountries: CountriesDTO.Response?
    var mockCountryDetail: CountryDetailDTO.Response?
    var mockData: Data?
    
    func getCountries(success: @escaping (TechnicalTest.CountriesDTO.Response?) -> Void, failure: @escaping (Alamofire.AFError) -> Void) {
        success(mockCountries)
    }
    
    func getDetail(name: String, success: @escaping (TechnicalTest.CountryDetailDTO.Response?) -> Void, failure: @escaping (Alamofire.AFError) -> Void) {
        success(mockCountryDetail)
    }
    
    func getFlag(url: String, success: @escaping (Data?) -> Void, failure: @escaping (Alamofire.AFError) -> Void) {
        success(mockData)
    }
    
}
