//
//  CountriesListPresenter.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 17/09/23.
//

import Foundation

class CountriesListPresenter: CountriesListPresenterProtocol {
    
    weak var view: CountriesListViewProtocol?
    var router: CountriesListRouterProtocol?
    var interactor: CountriesListInteractorProtocol?
    var data: [CountryModel] = []
    var filteredData: [CountryModel] = []
    
    func getData() {
        view?.setLoading(show: true)
        interactor?.getData() { [weak self] data in
            self?.view?.setLoading(show: false)
            self?.data = data
            self?.filteredData = data
            self?.view?.showData(data: data)
        }
    }
    
    func showDetail(name: String) {
        router?.showDetail(name: name)
    }
    
    func search(name: String) {
        filteredData = name.isEmpty ? data : data.filter({
            $0.name.lowercased().contains(name.lowercased())
        })
        view?.showData(data: filteredData)
    }
    
}
