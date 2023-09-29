//
//  CountryDetailInteractor.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 18/09/23.
//

import Foundation
import UIKit

class CountryDetailInteractor: CountryDetailInteractorProtocol {
    
    let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func getData(name: String, success: @escaping (CountryModel, UIImage?) -> Void) {
        repository.getDetail(
            name: name,
            success: { [weak self] response in
                guard let response = response,
                      let country = response.first else {
                    return
                }
                self?.getImage(url: country.flags.png) { image in
                    success(.init(name: country.name.official), image)
                }
            },
            failure: { _ in
                
            })
    }
    
    func getImage(url: String, success: @escaping (UIImage?) -> Void) {
        repository.getFlag(
            url: url,
            success: { response in
                guard let response else { return }
                success(UIImage(data: response))
            },
            failure: { _ in
                
            })
    }
    
}
