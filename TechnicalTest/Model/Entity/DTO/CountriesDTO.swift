//
//  CountriesDTO.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 17/09/23.
//

import Foundation

enum CountriesDTO {
    
    typealias Response = [Element]
    
    struct Element: Decodable {
        let name: Name

        enum CodingKeys: String, CodingKey {
            case name = "name"
        }
    }
    // MARK: - Name
    struct Name: Decodable {
        let common: String
        let official: String

        enum CodingKeys: String, CodingKey {
            case common = "common"
            case official = "official"
        }
    }

}
