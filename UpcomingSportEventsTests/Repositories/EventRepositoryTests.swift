//
//  EventRepositoryTests.swift
//  UpcomingSportEventsTests
//
//  Created by Rodrigo Alves on 13/02/2023.
//

@testable import UpcomingSportEvents
import XCTest

final class EventRepositoryTests: XCTestCase {

    var sut: EventRepository!

    override func setUp() {
    }

    override func tearDown() {
        sut = nil
    }

    func testEventRepository_whenGetEventsBySportIsCalledAndSportsServiceReturnsError_itReturnsNetworkingError() {
    }

    func testEventRepository_whenGetEventsBySportIsCalledAndSportsServiceReturnsNoData_itReturnsAnEmptyArrayOfEventsBySport() {
    }

    func testEventRepository_whenGetEventsBySportIsCalledAndSportsServiceReturnsSportsAndEvents_itReturnsAnArrayOfEventsBySportWithEventsSortedByStartTime() {
    }

    /*
    func getEventsBySport(completion: @escaping (Result<[EventsBySport], GetEventsBySportError>) -> Void) {
        sportsService.getAllSportsEagerLoadedWithEvents { result in
            switch result {
            case .success(let sportDataArray):
                var eventsBySport: [EventsBySport] = [EventsBySport]()

                sportDataArray.forEach { sportData in
                    let sport = Sport(id: sportData.id, name: sportData.name)
                    var events: [Event] = [Event]()

                    sportData.events.forEach { eventData in
                        let event = Event(
                            id: eventData.id,
                            name: eventData.name,
                            sportId: eventData.sportId,
                            startTime: eventData.startTime
                        )

                        events.append(event)
                    }

                    events.sort { $0.startTime < $1.startTime }

                    eventsBySport.append(EventsBySport(sport: sport, events: events))
                }

                completion(.success(eventsBySport))
            case .failure(let error):
                completion(.failure(.networkError(error)))
            }
        }
    }
    */
}
