//
//  CountryDetailProtocol.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 18/09/23.
//

import Foundation
import UIKit

protocol CountryDetailRouterProtocol: AnyObject {
    
    func createModule(name: String, repository: RepositoryProtocol) -> UIViewController
    
}

protocol CountryDetailPresenterProtocol: AnyObject {
    
    var view: CountryDetailViewProtocol? { get }
    var router: CountryDetailRouterProtocol? { get }
    func getData()
    
}

protocol CountryDetailViewProtocol: AnyObject {
    
    var presenter: CountryDetailPresenterProtocol? { get }
    
    func showName(name: String)
    func showImage(image: UIImage?)
    
}

protocol CountryDetailInteractorProtocol: AnyObject {
    
    func getData(name: String, success: @escaping (CountryModel, UIImage?) -> Void)
    func getImage(url: String, success: @escaping (UIImage?) -> Void)
    
}
