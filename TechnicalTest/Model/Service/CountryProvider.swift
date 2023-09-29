//
//  CountryProvider.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 18/09/23.
//

import Foundation

enum CountryEndPoint {
    
    case getList
    case getDetail(name: String)
    
    var path: String {
        switch self {
        case .getList:
            return "https://restcountries.com/v3.1/all"
        case .getDetail(let name):
            return "https://restcountries.com/v3.1/name/\(name)"
        }
    }
}
