//
//  CountriesListInteractor.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 17/09/23.
//

import Foundation
import Alamofire

class CountriesListInteractor: CountriesListInteractorProtocol {
    
    let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func getData(success: @escaping ([CountryModel]) -> Void) {
        repository.getCountries(
            success: { response in
                guard let response else { return }
                let data = response.map { CountryModel(name: $0.name.common) }
                success(data)
            },
            failure: { error in
                
            })
    }
    
}
