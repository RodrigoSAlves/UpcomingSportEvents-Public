// MARK: - Mocks generated from file: UpcomingSportEvents/Networking/Protocols/BaseServiceProtocol.swift at 2023-02-13 22:25:58 +0000

//
//  BaseServiceProtocol.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import Cuckoo
@testable import UpcomingSportEvents

import Foundation






 class MockBaseServiceProtocol: BaseServiceProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = BaseServiceProtocol
    
     typealias Stubbing = __StubbingProxy_BaseServiceProtocol
     typealias Verification = __VerificationProxy_BaseServiceProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: BaseServiceProtocol?

     func enableDefaultImplementation(_ stub: BaseServiceProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     var baseURL: URL {
        get {
            return cuckoo_manager.getter("baseURL",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.baseURL)
        }
        
    }
    
    

    

    

     struct __StubbingProxy_BaseServiceProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var baseURL: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockBaseServiceProtocol, URL> {
            return .init(manager: cuckoo_manager, name: "baseURL")
        }
        
        
        
    }

     struct __VerificationProxy_BaseServiceProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var baseURL: Cuckoo.VerifyReadOnlyProperty<URL> {
            return .init(manager: cuckoo_manager, name: "baseURL", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
    }
}


 class BaseServiceProtocolStub: BaseServiceProtocol {
    
    
    
    
     var baseURL: URL {
        get {
            return DefaultValueRegistry.defaultValue(for: (URL).self)
        }
        
    }
    
    

    

    
}





// MARK: - Mocks generated from file: UpcomingSportEvents/Networking/Protocols/SportsServiceProtocol.swift at 2023-02-13 22:25:58 +0000

//
//  SportsServiceProtocol.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import Cuckoo
@testable import UpcomingSportEvents

import Foundation






 class MockSportsServiceProtocol: SportsServiceProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = SportsServiceProtocol
    
     typealias Stubbing = __StubbingProxy_SportsServiceProtocol
     typealias Verification = __VerificationProxy_SportsServiceProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: SportsServiceProtocol?

     func enableDefaultImplementation(_ stub: SportsServiceProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func getAllSportsEagerLoadedWithEvents(completion: @escaping ((Result<[SportData], NetworkError>) -> Void))  {
        
    return cuckoo_manager.call(
    """
    getAllSportsEagerLoadedWithEvents(completion: @escaping ((Result<[SportData], NetworkError>) -> Void))
    """,
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getAllSportsEagerLoadedWithEvents(completion: completion))
        
    }
    
    

     struct __StubbingProxy_SportsServiceProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func getAllSportsEagerLoadedWithEvents<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(((Result<[SportData], NetworkError>) -> Void))> where M1.MatchedType == ((Result<[SportData], NetworkError>) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(((Result<[SportData], NetworkError>) -> Void))>] = [wrap(matchable: completion) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockSportsServiceProtocol.self, method:
    """
    getAllSportsEagerLoadedWithEvents(completion: @escaping ((Result<[SportData], NetworkError>) -> Void))
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_SportsServiceProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func getAllSportsEagerLoadedWithEvents<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<(((Result<[SportData], NetworkError>) -> Void)), Void> where M1.MatchedType == ((Result<[SportData], NetworkError>) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(((Result<[SportData], NetworkError>) -> Void))>] = [wrap(matchable: completion) { $0 }]
            return cuckoo_manager.verify(
    """
    getAllSportsEagerLoadedWithEvents(completion: @escaping ((Result<[SportData], NetworkError>) -> Void))
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class SportsServiceProtocolStub: SportsServiceProtocol {
    

    

    
    
    
    
     func getAllSportsEagerLoadedWithEvents(completion: @escaping ((Result<[SportData], NetworkError>) -> Void))   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: UpcomingSportEvents/Repositories/Protocols/EventRepositoryProtocol.swift at 2023-02-13 22:25:58 +0000

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
    

    

    

    
    
    
    
     func getEventsBySport(completion: @escaping (Result<[EventsBySport], GetEventsBySportError>) -> Void)  {
        
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
    

    

    
    
    
    
     func getEventsBySport(completion: @escaping (Result<[EventsBySport], GetEventsBySportError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}




