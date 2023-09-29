//
//  CountriesListViewController.swift
//  TechnicalTest
//
//  Created by Alexander Rodriguez on 17/09/23.
//

import Foundation
import UIKit

class CountriesListViewController: UIViewController {
    
    static let identifier: String = "CountriesListViewController"
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var progress: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var presenter: CountriesListPresenterProtocol?
    var data: [CountryModel]?
    
    override func viewWillAppear(_ animated: Bool) {
        searchBar?.delegate = self
        setupView()
        setupProgressView()
        setupTableView()
        presenter?.getData()
    }
    
    func setupView() {
        title = "Lista de paises"
    }
    
    func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.reloadData()
    }
    
    func setupProgressView() {
        progress.hidesWhenStopped = true
    }
    
}

extension CountriesListViewController: CountriesListViewProtocol {
    
    func setLoading(show: Bool) {
        progress.isHidden = !show
        if show {
            progress.startAnimating()
        } else {
            progress.stopAnimating()
        }
    }
    
    func showData(data: [CountryModel]) {
        self.data = data
        tableView.reloadData()
    }
}

extension CountriesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let country = data?[indexPath.row] else {return }
        presenter?.showDetail(name: country.name)
    }
    
}

extension CountriesListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Identifier.countryCell.rawValue, for: indexPath)
        cell.textLabel?.text = data?[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    
}


extension CountriesListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.search(name: searchText)
    }
    
}
