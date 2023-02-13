//
//  EventListViewModelTests.swift
//  UpcomingSportEventsTests
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import Cuckoo
@testable import UpcomingSportEvents
import XCTest

final class EventListViewModelTests: XCTestCase {

    var mockEventRepository: MockEventRepositoryProtocol!
    var mockFavoritesRepository: MockFavoritesRepositoryProtocol!
    var mockViewModelDelegate: MockEventListViewModelDelegate!
    var sut: EventListViewModel!

    override func setUp() {
        continueAfterFailure = false
        mockEventRepository = MockEventRepositoryProtocol()
        mockFavoritesRepository = MockFavoritesRepositoryProtocol()
        mockViewModelDelegate = MockEventListViewModelDelegate()
        sut = EventListViewModel(eventRepository: mockEventRepository, favoritesRepository: mockFavoritesRepository)
        sut.delegate = mockViewModelDelegate
    }

    override func tearDown() {
        mockEventRepository = nil
        mockFavoritesRepository = nil
        mockViewModelDelegate = nil
        sut = nil
    }

    func testEventListViewModel_whenLoadEventsIsCalledAndRepositoryReturnsResultSuccess_viewModelStateIsUpdatedAndDelegateIsCalled() {
        // Given
        let expectedEventsBySport = SportAndEventsFactory.makeDefaultEventsBySport()
        let expectation = expectation(description: "Wait for async completion handlers to be called")

        stub(mockEventRepository) { stubbed in
            when(stubbed.getEventsBySport(completion: anyClosure())).then { completion in
                completion(.success(expectedEventsBySport))
                expectation.fulfill()
            }
        }

        stub(mockViewModelDelegate) { stubbed in
            when(stubbed.didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: true)).thenDoNothing()
            when(stubbed.didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: false)).thenDoNothing()
            when(stubbed.didFinishLoadingSportsAndEvents()).thenDoNothing()
            when(stubbed.didUpdateGetEventsBySportError(error: nilValue())).thenDoNothing()
        }

        // When
        sut.loadSportingEvents()
        verify(mockViewModelDelegate).didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: true)
        verify(mockViewModelDelegate).didUpdateGetEventsBySportError(error: nilValue())

        wait(for: [expectation], timeout: 0.1)

        verify(mockEventRepository).getEventsBySport(completion: anyClosure())
        verify(mockViewModelDelegate).didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: false)
        verify(mockViewModelDelegate).didFinishLoadingSportsAndEvents()

        XCTAssertEqual(sut.eventsBySport.count, expectedEventsBySport.count)

        for (index, eventsBySport) in expectedEventsBySport.enumerated() {
            XCTAssertEqual(sut.eventsBySport[index].sport.id, eventsBySport.sport.id)
            XCTAssertEqual(sut.eventsBySport[index].events.count, eventsBySport.events.count)
        }
    }
}
