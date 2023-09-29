//
//  CountryDetailRouter.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 18/09/23.
//

import Foundation
import UIKit

class CountryDetailRouter: CountryDetailRouterProtocol {
    
    var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: Constant.StoryboardName.main.rawValue, bundle: .main)
    }
    
    func createModule(name: String, repository: RepositoryProtocol) -> UIViewController {
        guard let view = mainStoryboard.instantiateViewController(identifier: CountryDetailViewController.identifier) as? CountryDetailViewController else {
            return .init()
        }
        let presenter = CountryDetailPresenter(name: name)
        let interactor = CountryDetailInteractor(repository: repository)
        view.presenter = presenter
        presenter.view = view
        presenter.router = self
        presenter.interactor = interactor
        return view
    }
    
}
