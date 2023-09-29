//
//  CountryDetailTest.swift
//  TechnicalTestTests
//
//  Created by Alexander Rodriguez on 18/09/23.
//

import XCTest
@testable import TechnicalTest

final class CountryDetailTest: XCTestCase {
    
    enum Constants {
        static let name: String = "Peru"
        static let imageName: String = "square.and.arrow.up"
    }
    
    var mockView: CountryDetailViewController!
    var mockRouter: CountryDetailRouter!
    var mockRepository: MockRepository!
    
    var nameLabel: UILabel = .init()
    var image: UIImageView = .init()

    override func setUp() {
        mockRepository = MockRepository()
        mockRouter = CountryDetailRouter()
        mockView = mockRouter.createModule(name: Constants.name, repository: mockRepository) as? CountryDetailViewController
        mockView.name = nameLabel
        mockView.image = image
    }

    override func tearDown() {
        mockView = nil
        mockRouter = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func testGetData_GivenMockCountry_WhenGettingData_ThenDataIsDisplayed() {
        // Given
        let mockCountryDetail: CountryDetailDTO.Response = [.init(name: .init(common: Constants.name, official: Constants.name), flags: .init(png: "", svg: ""))]
        let mockData: Data? = UIImage(systemName: Constants.imageName)?.pngData()
        mockRepository.mockCountryDetail = mockCountryDetail
        mockRepository.mockData = mockData

        // When
        mockView.presenter?.getData()

        // Then
        XCTAssertEqual(mockView.name.text, Constants.name)
        XCTAssertNotNil(mockView.image)
    }
    
}
