//
//  TechnicalTestTests.swift
//  TechnicalTestTests
//
//  Created by Alexander Rodriguez on 18/09/23.
//

import XCTest
import Alamofire
@testable import TechnicalTest

final class CountryListTest: XCTestCase {
    
    enum Constants {
        static let mockCountries: CountriesDTO.Response = [.init(name: .init(common: "Peru", official: "Peru")),
                                                           .init(name: .init(common: "Brazil", official: "Brazil")),
                                                           .init(name: .init(common: "India", official: "India")),
                                                           .init(name: .init(common: "USA", official: "USA"))]
        static let imageName: String = "square.and.arrow.up"
        static let searchQuery: String = "PE"
    }
    
    var mockView: CountriesListViewController!
    var mockRouter: CountriesListRouter!
    var mockRepository: MockRepository!

    let seachBar = UISearchBar()
    let progress = UIActivityIndicatorView()
    let tableView = UITableView()
    
    override func setUp() {
        mockRepository = MockRepository()
        mockRouter = CountriesListRouter(repository: mockRepository)
        mockView = mockRouter.createModule() as? CountriesListViewController
        mockView.tableView = tableView
        mockView.progress = progress
        mockView.searchBar = seachBar
    }

    override func tearDown() {
        mockView = nil
        mockRouter = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func testGetData_GivenMockCountries_WhenGettingData_ThenDataIsDisplayed() {
        // Given
        mockRepository.mockCountries = Constants.mockCountries

        // When
        mockView.presenter?.getData()

        // Then
        XCTAssertFalse(mockView.progress.isAnimating)
        XCTAssertNotNil(mockView.data)
    }
    
    func testSearch_GivenCountries_WhenSearchingWithQuery_ThenFilteredDataIsDisplayed() {
        // Given
        mockRepository.mockCountries = Constants.mockCountries

        // When
        mockView.presenter?.getData()
        mockView.presenter?.search(name: Constants.searchQuery)

        // Then
        XCTAssertFalse(mockView.progress.isAnimating)
        XCTAssertNotNil(mockView.data)
        XCTAssertEqual(mockView.data?.count, 1)
        XCTAssertEqual(mockView.data?.first?.name.lowercased().contains(Constants.searchQuery.lowercased()), true)
    }
    
}
