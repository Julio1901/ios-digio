//
//  MainViewModelTests.swift
//  DigioTests
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import XCTest
@testable import Digio
@testable import SpotlightsModule

final class MainViewModelTests: XCTestCase {

    var mainViewModel: MainViewModel!
    var fetchSpotlightsUseCase: FetchSpotlightsUseCase!
    var fetchCashUseCase: FetchCashUseCase!
    var fetchProductsUseCase: FetchProductsUseCase!
    override func setUpWithError() throws {
        fetchSpotlightsUseCase = MockSpotlightsUseCase(shouldFail: false)
        fetchCashUseCase = MockCashUseCase(shouldFail: false)
        fetchProductsUseCase = MockProductsUseCase(shouldFail: false)
        mainViewModel = MainViewModel(
            fetchSpotlightsUseCase: fetchSpotlightsUseCase,
            fetchCashUseCase: fetchCashUseCase,
            fetchProductsUseCase: fetchProductsUseCase
        )
    }
    override func tearDownWithError() throws {
        mainViewModel = nil
        fetchSpotlightsUseCase = nil
        fetchCashUseCase = nil
        fetchProductsUseCase = nil
    }
    func testSpotlightListShouldBePopulatedCorrectlyAfterFetchItems() async throws {
        mainViewModel.fetchItems()
        XCTAssertEqual(2, mainViewModel.spotlightViewModelList.count, "Spotligh list should contain 2 items after fetch items")
    }
    func testDigioCashListShouldBePopulatedCorrectlyAfterFetchItems() async throws {
        mainViewModel.fetchItems()
        XCTAssertEqual(1, mainViewModel.digioCashViewModelList.count, "Digio Cash list should contain 1 item after fetch items")
    }
    func testProductListShouldBePopulatedCorrectlyAfterFetchItems() async throws {
        mainViewModel.fetchItems()
        XCTAssertEqual(3, mainViewModel.productViewModelList.count, "Product list should contain 1 item after fetch items")
    }
    func testSpotlightListShouldBeEmptyIfUseCaseReturnError() async throws {
        fetchSpotlightsUseCase = MockSpotlightsUseCase(shouldFail: true)
        mainViewModel = MainViewModel(
            fetchSpotlightsUseCase: fetchSpotlightsUseCase,
            fetchCashUseCase: fetchCashUseCase,
            fetchProductsUseCase: fetchProductsUseCase
        )
        mainViewModel.fetchItems()
        XCTAssertEqual(0, mainViewModel.spotlightViewModelList.count, "Spotligh list should contain 0 items after fetch items if use case fails")
    }
    func testDigioCashListShouldBeEmptyIfUseCaseReturnError() async throws {
        fetchCashUseCase = MockCashUseCase(shouldFail: true)
        mainViewModel = MainViewModel(
            fetchSpotlightsUseCase: fetchSpotlightsUseCase,
            fetchCashUseCase: fetchCashUseCase,
            fetchProductsUseCase: fetchProductsUseCase
        )
        mainViewModel.fetchItems()
        XCTAssertEqual(0, mainViewModel.digioCashViewModelList.count, "Digio Cash list should contain 0 items after fetch items if use case fails")
    }
    func testProductListShouldBeEmptyIfUseCaseReturnError() async throws {
        fetchProductsUseCase = MockProductsUseCase(shouldFail: true)
        mainViewModel = MainViewModel(
            fetchSpotlightsUseCase: fetchSpotlightsUseCase,
            fetchCashUseCase: fetchCashUseCase,
            fetchProductsUseCase: fetchProductsUseCase
        )
        mainViewModel.fetchItems()
        XCTAssertEqual(0, mainViewModel.productViewModelList.count, "Products list should contain 0 items after fetch items if use case fails")
    }
    func testSpotlightListShouldBePopulatedEvenIfOtherUseCasesFail() async throws {
        fetchCashUseCase = MockCashUseCase(shouldFail: true)
        fetchProductsUseCase = MockProductsUseCase(shouldFail: true)
        mainViewModel = MainViewModel(
            fetchSpotlightsUseCase: fetchSpotlightsUseCase,
            fetchCashUseCase: fetchCashUseCase,
            fetchProductsUseCase: fetchProductsUseCase
        )
        mainViewModel.fetchItems()
        XCTAssertEqual(2, mainViewModel.spotlightViewModelList.count, "Spotligh list should contain 2 items after fetch items if use case fails")
        XCTAssertEqual(0, mainViewModel.digioCashViewModelList.count, "Digio Cash list should contain 0 items after fetch items if use case fails")
        XCTAssertEqual(0, mainViewModel.productViewModelList.count, "Products list should contain 0 items after fetch items if use case fails")
    }
    func testDigioCashListShouldBePopulatedEvenIfOtherUseCasesFail() async throws {
        fetchSpotlightsUseCase = MockSpotlightsUseCase(shouldFail: true)
        fetchProductsUseCase = MockProductsUseCase(shouldFail: true)
        mainViewModel = MainViewModel(
            fetchSpotlightsUseCase: fetchSpotlightsUseCase,
            fetchCashUseCase: fetchCashUseCase,
            fetchProductsUseCase: fetchProductsUseCase
        )
        mainViewModel.fetchItems()
        XCTAssertEqual(1, mainViewModel.digioCashViewModelList.count, "Digio Cash list should contain 1 item after fetch items if use case fails")
        XCTAssertEqual(0, mainViewModel.spotlightViewModelList.count, "Spotligh list should contain 0 items after fetch items if use case fails")
        XCTAssertEqual(0, mainViewModel.productViewModelList.count, "Products list should contain 0 items after fetch items if use case fails")
    }
    func testProductsListShouldBePopulatedEvenIfOtherUseCasesFail() async throws {
        fetchSpotlightsUseCase = MockSpotlightsUseCase(shouldFail: true)
        fetchCashUseCase = MockCashUseCase(shouldFail: true)
        mainViewModel = MainViewModel(
            fetchSpotlightsUseCase: fetchSpotlightsUseCase,
            fetchCashUseCase: fetchCashUseCase,
            fetchProductsUseCase: fetchProductsUseCase
        )
        mainViewModel.fetchItems()
        XCTAssertEqual(3, mainViewModel.productViewModelList.count, "Product list should contain 3 items after fetch items if use case fails")
        XCTAssertEqual(0, mainViewModel.spotlightViewModelList.count, "Spotligh list should contain 0 items after fetch items if use case fails")
        XCTAssertEqual(0, mainViewModel.digioCashViewModelList.count, "Digio Cash list should contain 0 items after fetch items if use case fails")
    }
}
