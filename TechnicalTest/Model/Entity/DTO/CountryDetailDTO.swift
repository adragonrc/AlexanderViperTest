//
//  CountryDetailDTO.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 18/09/23.
//

import Foundation

enum CountryDetailDTO {
    
    typealias Response = [Element]
    
    struct Element: Decodable {
        let name: Name
        let flags: Flags

        enum CodingKeys: String, CodingKey {
            case name = "name"
            case flags = "flags"
        }
    }

    // MARK: - Flags
    struct Flags: Decodable {
        let png: String
        let svg: String

        enum CodingKeys: String, CodingKey {
            case png = "png"
            case svg = "svg"
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

