//
//  CountryDetailViewController.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 18/09/23.
//

import Foundation
import UIKit

class CountryDetailViewController: UIViewController {
    
    static let identifier: String = "CountryDetailViewController"
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    var presenter: CountryDetailPresenterProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getData()
    }
    
}

extension CountryDetailViewController: CountryDetailViewProtocol {
    
    func showName(name: String) {
        self.name.text = name
    }
    
    func showImage(image: UIImage?) {
        self.image.image = image
    }
    
}
