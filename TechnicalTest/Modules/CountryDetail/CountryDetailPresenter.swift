//
//  CountryDetailPresenter.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 18/09/23.
//

import Foundation

class CountryDetailPresenter: CountryDetailPresenterProtocol {
    
    var view: CountryDetailViewProtocol?
    var router: CountryDetailRouterProtocol?
    var interactor: CountryDetailInteractorProtocol?
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getData() {
        interactor?.getData(name: name, success: { [weak self] model, image in
            self?.view?.showName(name: model.name)
            self?.view?.showImage(image: image)
        })
    }
    
}
