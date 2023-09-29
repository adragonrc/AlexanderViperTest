//
//  CountriesListProtocol.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 17/09/23.
//

import Foundation
import UIKit

protocol CountriesListRouterProtocol: AnyObject {
    
    func createModule() -> UIViewController
    func showDetail(name: String)
    
}

protocol CountriesListPresenterProtocol: AnyObject {
    
    var view: CountriesListViewProtocol? { get }
    var router: CountriesListRouterProtocol? { get }
    func getData()
    func search(name: String)
    func showDetail(name: String)
    
}

protocol CountriesListViewProtocol: AnyObject {
    
    var presenter: CountriesListPresenterProtocol? { get }
    
    func setLoading(show: Bool)
    func showData(data: [CountryModel])
    
}

protocol CountriesListInteractorProtocol: AnyObject {
    
    func getData(success: @escaping ([CountryModel]) -> Void)
    
}
