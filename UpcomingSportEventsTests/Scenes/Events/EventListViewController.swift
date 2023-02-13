//
//  EventListViewController.swift
//  UpcomingSportEventsTests
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import Cuckoo
@testable import UpcomingSportEvents
import XCTest

final class EventListViewControllerTests: XCTestCase {

    var mockViewConstructor: MockViewConstructorProtocol!
    var mockViewModel: MockEventListViewModel!
    var sut: EventListViewController!
    var rootViewController: UIViewController!
    var window: UIWindow!

    override func setUp() {
        continueAfterFailure = false
        mockViewConstructor = MockViewConstructorProtocol()
        mockViewModel = MockEventListViewModel(eventRepository: MockEventRepositoryProtocol(), favoritesRepository: MockFavoritesRepositoryProtocol())
        sut = EventListViewController.instantiate()
        sut.viewModel = mockViewModel
        sut.viewConstructor = mockViewConstructor
    }

    override func tearDown() {
        mockViewModel = nil
        rootViewController = nil
        window = nil
        sut = nil
    }

    func presentSutInWindow() {
        rootViewController = UIViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        window.rootViewController?.present(sut, animated: true)
    }

    func testEventListViewController_itReturnsTheCorrectNumberOfSectionsForTableView() {
        // When
        let eventsBySport = SportAndEventsFactory.makeDefaultEventsBySport()

        stub(mockViewModel) { stubbed in
            when(stubbed.eventsBySport.get).thenReturn(eventsBySport)
        }

        // When
        sut.loadViewIfNeeded()

        // Then
        XCTAssertEqual(sut.numberOfSections(in: sut.mainTableView), eventsBySport.count)
    }

    func testEventListViewController_itReturnsTheCorrectNumberOfRowsForEachSection() {
        // When
        let eventsBySport = SportAndEventsFactory.makeDefaultEventsBySport()

        stub(mockViewModel) { stubbed in
            when(stubbed.eventsBySport.get).thenReturn(eventsBySport)
            when(stubbed.getSportSectionExpansionState(sport: anyValue())).thenCallRealImplementation()
            when(stubbed.getSportSectionIdentifier(sport: anyValue())).thenCallRealImplementation()
            when(stubbed.sportsSectionsExpansionStatuses.get).thenCallRealImplementation()
        }

        // When
        sut.loadViewIfNeeded()

        // Then
        for (section, _) in eventsBySport.enumerated() {
            XCTAssertEqual(sut.tableView(sut.mainTableView, numberOfRowsInSection: section), 1)
        }
    }

    func testEventListViewmodel_whenViewModelCallsdidUpdateGetEventsBySportError_itPresentsCustomAlertViewController() {
        let presentableError = GetEventsBySportError.networkError(.noInternetConnection)

        // When
        let eventsBySport = SportAndEventsFactory.makeDefaultEventsBySport()

        stub(mockViewModel) { stubbed in
            when(stubbed.viewWillAppear()).thenCallRealImplementation()
            when(stubbed.eventsBySport.get).thenReturn(eventsBySport)
            when(stubbed.getSportSectionExpansionState(sport: anyValue())).thenCallRealImplementation()
            when(stubbed.getSportSectionIdentifier(sport: anyValue())).thenCallRealImplementation()
            when(stubbed.sportsSectionsExpansionStatuses.get).thenCallRealImplementation()
            when(stubbed.getEventsBySportError.get).thenReturn(presentableError)
            when(stubbed.loadSportingEvents()).thenDoNothing()
            when(stubbed.isFavorite(event: anyValue())).thenReturn(false)
        }

        let options = CustomAlertViewController.LayoutOptions(
            icon: presentableError.icon,
            title: presentableError.title,
            message: presentableError.message,
            actionButtonTitle: "OK",
            actionButtonHandler: nil
        )

        let matcher: ParameterMatcher<CustomAlertViewController.LayoutOptions> = ParameterMatcher {
            return $0.icon == options.icon
            && $0.title == options.title
            && $0.message == options.message
            && $0.actionButtonTitle == options.actionButtonTitle
        }

        let customAlertViewController = CustomAlertViewController.instantiate()
        customAlertViewController.options = options

        stub(mockViewConstructor) { stubbed in
            when(stubbed.getCustomAlertViewController(layoutOptions: matcher)).thenReturn(customAlertViewController)
        }

        let expectation1 = expectation(description: "Wait for EventListViewController to be presented")

        presentSutInWindow()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            expectation1.fulfill()
        }

        wait(for: [expectation1], timeout: 0.75)

        // When
        sut.didUpdateGetEventsBySportError(error: presentableError)

        let expectation2 = expectation(description: "Wait for CustomAlertViewController to be presented")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            expectation2.fulfill()
        }

        wait(for: [expectation2], timeout: 0.75)

        verify(mockViewConstructor).getCustomAlertViewController(layoutOptions: matcher)
        XCTAssertTrue(window.getTopMostController() is CustomAlertViewController)
    }
}
