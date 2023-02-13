//
//  EventRepositoryTests.swift
//  UpcomingSportEventsTests
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import Cuckoo
@testable import UpcomingSportEvents
import XCTest

final class EventRepositoryTests: XCTestCase {

    var mockSportsService: MockSportsServiceProtocol!
    var sut: EventRepository!

    override func setUp() {
        continueAfterFailure = false
        mockSportsService = MockSportsServiceProtocol()
        sut = EventRepository(sportsService: mockSportsService)
    }

    override func tearDown() {
        mockSportsService = nil
        sut = nil
    }

    func testEventRepository_whenGetEventsBySportIsCalledAndSportsServiceReturnsError_itReturnsNetworkingError() {
        // Given
        let expectedNetworkErrorType: NetworkError = .noInternetConnection
        stub(mockSportsService) { stubbed in
            when(stubbed.getAllSportsEagerLoadedWithEvents(completion: anyClosure())).then { completion in
                completion(.failure(expectedNetworkErrorType))
            }
        }

        // When
        let expectation = expectation(description: "Wait for completion to be called")
        var result: Result<[EventsBySport], GetEventsBySportError>?
        sut.getEventsBySport { operationResult in
            result = operationResult
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.1)

        XCTAssertNotNil(result)

        switch result! {
        case .success:
            XCTFail("EventRepository should not be returning any success value under considering context")
        case .failure(let getEventsBySportError):
            switch getEventsBySportError {
            case .networkError(let netWorkError):
                XCTAssertEqual(netWorkError, expectedNetworkErrorType)
            }
        }
    }

    func testEventRepository_whenGetEventsBySportIsCalledAndSportsServiceReturnsNoData_itReturnsAnEmptyArrayOfEventsBySport() {
        stub(mockSportsService) { stubbed in
            when(stubbed.getAllSportsEagerLoadedWithEvents(completion: anyClosure())).then { completion in
                completion(.success([SportData]()))
            }
        }

        // When
        let expectation = expectation(description: "Wait for completion to be called")
        var result: Result<[EventsBySport], GetEventsBySportError>?
        sut.getEventsBySport { operationResult in
            result = operationResult
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.1)

        XCTAssertNotNil(result)

        do {
            let successValue = try result!.get()
            XCTAssertTrue(successValue.isEmpty)
        } catch {
            XCTFail("Expecting result to be of type .success but it is .failure")
        }
    }

    func testEventRepository_whenGetEventsBySportIsCalledAndSportsServiceReturnsSportsAndEvents_itReturnsAnArrayOfEventsBySportWithEventsSortedByStartTime() {

        let sportDataArray = SportAndEventsFactory.makeDefaultSportsAndEventsData()

        stub(mockSportsService) { stubbed in
            when(stubbed.getAllSportsEagerLoadedWithEvents(completion: anyClosure())).then { completion in
                completion(.success(sportDataArray))
            }
        }

        // When
        let expectation = expectation(description: "Wait for completion to be called")
        var result: Result<[EventsBySport], GetEventsBySportError>?
        sut.getEventsBySport { operationResult in
            result = operationResult
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.1)

        XCTAssertNotNil(result)

        do {
            let successValue = try result!.get()

            for (sportIndex, sport) in sportDataArray.enumerated() {
                XCTAssertEqual(successValue[sportIndex].sport.id, sport.id)
                XCTAssertEqual(successValue[sportIndex].sport.name, sport.name)

                let sortedEvents = sport.events.sorted { $0.startTime < $1.startTime }

                for (eventIndex, event) in sortedEvents.enumerated() {
                    XCTAssertEqual(successValue[sportIndex].events[eventIndex].id, event.id)
                    XCTAssertEqual(successValue[sportIndex].events[eventIndex].name, event.name)
                    XCTAssertEqual(successValue[sportIndex].events[eventIndex].sportId, event.sportId)
                    XCTAssertEqual(successValue[sportIndex].events[eventIndex].startTime, event.startTime)
                }
            }
        } catch {
            XCTFail("Expecting result to be of type .success but it is .failure")
        }
    }
}
