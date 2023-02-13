// MARK: - Mocks generated from file: UpcomingSportEvents/Repositories/Protocols/EventRepositoryProtocol.swift at 2023-02-13 21:43:45 +0000

//
//  EventRepositoryProtocol.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 12/02/2023.
//

import Cuckoo
@testable import UpcomingSportEvents

import Foundation

 class MockEventRepositoryProtocol: EventRepositoryProtocol, Cuckoo.ProtocolMock {

     typealias MocksType = EventRepositoryProtocol

     typealias Stubbing = __StubbingProxy_EventRepositoryProtocol
     typealias Verification = __VerificationProxy_EventRepositoryProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    private var __defaultImplStub: EventRepositoryProtocol?

     func enableDefaultImplementation(_ stub: EventRepositoryProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

     func getEventsBySport(completion: @escaping (Result<[EventsBySport], GetEventsBySportError>) -> Void) {

    return cuckoo_manager.call(
    """
    getEventsBySport(completion: @escaping (Result<[EventsBySport], GetEventsBySportError>) -> Void)
    """,
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:

                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getEventsBySport(completion: completion))
    }

     struct __StubbingProxy_EventRepositoryProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }

        func getEventsBySport<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.ProtocolStubNoReturnFunction<((Result<[EventsBySport], GetEventsBySportError>) -> Void)> where M1.MatchedType == (Result<[EventsBySport], GetEventsBySportError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((Result<[EventsBySport], GetEventsBySportError>) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEventRepositoryProtocol.self, method:
    """
    getEventsBySport(completion: @escaping (Result<[EventsBySport], GetEventsBySportError>) -> Void)
    """, parameterMatchers: matchers))
        }
    }

     struct __VerificationProxy_EventRepositoryProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        @discardableResult
        func getEventsBySport<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<((Result<[EventsBySport], GetEventsBySportError>) -> Void), Void> where M1.MatchedType == (Result<[EventsBySport], GetEventsBySportError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((Result<[EventsBySport], GetEventsBySportError>) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return cuckoo_manager.verify(
    """
    getEventsBySport(completion: @escaping (Result<[EventsBySport], GetEventsBySportError>) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

 class EventRepositoryProtocolStub: EventRepositoryProtocol {

     func getEventsBySport(completion: @escaping (Result<[EventsBySport], GetEventsBySportError>) -> Void) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}
