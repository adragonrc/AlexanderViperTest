//
//  CountriesListRouter.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 17/09/23.
//

import Foundation
import UIKit

class CountriesListRouter: CountriesListRouterProtocol {
    
    var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: Constant.StoryboardName.main.rawValue, bundle: .main)
    }
    var repository: RepositoryProtocol
    weak var presenter: UINavigationController?
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func createModule() -> UIViewController {
        guard let view = mainStoryboard.instantiateViewController(identifier: CountriesListViewController.identifier) as? CountriesListViewController else {
            return .init()
        }
        let presenter = CountriesListPresenter()
        let interactor = CountriesListInteractor(repository: repository)
        view.presenter = presenter
        presenter.view = view
        presenter.router = self
        presenter.interactor = interactor
        return view
    }
    
    func showDetail(name: String) {
        let view = CountryDetailRouter().createModule(name: name, repository: repository)
        presenter?.pushViewController(view, animated: true)
    }
    
}
