// MARK: - Mocks generated from file: UpcomingSportEvents/Networking/Protocols/BaseServiceProtocol.swift at 2023-02-13 22:53:47 +0000

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





// MARK: - Mocks generated from file: UpcomingSportEvents/Networking/Protocols/SportsServiceProtocol.swift at 2023-02-13 22:53:47 +0000

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





// MARK: - Mocks generated from file: UpcomingSportEvents/Repositories/Protocols/EventRepositoryProtocol.swift at 2023-02-13 22:53:47 +0000

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





// MARK: - Mocks generated from file: UpcomingSportEvents/Repositories/Protocols/FavoritesRepositoryProtocol.swift at 2023-02-13 22:53:47 +0000

//
//  FavoritesRepositoryProtocol.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 12/02/2023.
//

import Cuckoo
@testable import UpcomingSportEvents

import Foundation






 class MockFavoritesRepositoryProtocol: FavoritesRepositoryProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = FavoritesRepositoryProtocol
    
     typealias Stubbing = __StubbingProxy_FavoritesRepositoryProtocol
     typealias Verification = __VerificationProxy_FavoritesRepositoryProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: FavoritesRepositoryProtocol?

     func enableDefaultImplementation(_ stub: FavoritesRepositoryProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func getFavoriteStatus(event: Event) -> Bool {
        
    return cuckoo_manager.call(
    """
    getFavoriteStatus(event: Event) -> Bool
    """,
            parameters: (event),
            escapingParameters: (event),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getFavoriteStatus(event: event))
        
    }
    
    
    
    
    
     func toggleFavoriteStatus(event: Event)  {
        
    return cuckoo_manager.call(
    """
    toggleFavoriteStatus(event: Event)
    """,
            parameters: (event),
            escapingParameters: (event),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.toggleFavoriteStatus(event: event))
        
    }
    
    
    
    
    
     func addToFavorites(event: Event)  {
        
    return cuckoo_manager.call(
    """
    addToFavorites(event: Event)
    """,
            parameters: (event),
            escapingParameters: (event),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.addToFavorites(event: event))
        
    }
    
    
    
    
    
     func removeFromFavorites(event: Event)  {
        
    return cuckoo_manager.call(
    """
    removeFromFavorites(event: Event)
    """,
            parameters: (event),
            escapingParameters: (event),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.removeFromFavorites(event: event))
        
    }
    
    

     struct __StubbingProxy_FavoritesRepositoryProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func getFavoriteStatus<M1: Cuckoo.Matchable>(event: M1) -> Cuckoo.ProtocolStubFunction<(Event), Bool> where M1.MatchedType == Event {
            let matchers: [Cuckoo.ParameterMatcher<(Event)>] = [wrap(matchable: event) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFavoritesRepositoryProtocol.self, method:
    """
    getFavoriteStatus(event: Event) -> Bool
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func toggleFavoriteStatus<M1: Cuckoo.Matchable>(event: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Event)> where M1.MatchedType == Event {
            let matchers: [Cuckoo.ParameterMatcher<(Event)>] = [wrap(matchable: event) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFavoritesRepositoryProtocol.self, method:
    """
    toggleFavoriteStatus(event: Event)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func addToFavorites<M1: Cuckoo.Matchable>(event: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Event)> where M1.MatchedType == Event {
            let matchers: [Cuckoo.ParameterMatcher<(Event)>] = [wrap(matchable: event) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFavoritesRepositoryProtocol.self, method:
    """
    addToFavorites(event: Event)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func removeFromFavorites<M1: Cuckoo.Matchable>(event: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Event)> where M1.MatchedType == Event {
            let matchers: [Cuckoo.ParameterMatcher<(Event)>] = [wrap(matchable: event) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFavoritesRepositoryProtocol.self, method:
    """
    removeFromFavorites(event: Event)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_FavoritesRepositoryProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func getFavoriteStatus<M1: Cuckoo.Matchable>(event: M1) -> Cuckoo.__DoNotUse<(Event), Bool> where M1.MatchedType == Event {
            let matchers: [Cuckoo.ParameterMatcher<(Event)>] = [wrap(matchable: event) { $0 }]
            return cuckoo_manager.verify(
    """
    getFavoriteStatus(event: Event) -> Bool
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func toggleFavoriteStatus<M1: Cuckoo.Matchable>(event: M1) -> Cuckoo.__DoNotUse<(Event), Void> where M1.MatchedType == Event {
            let matchers: [Cuckoo.ParameterMatcher<(Event)>] = [wrap(matchable: event) { $0 }]
            return cuckoo_manager.verify(
    """
    toggleFavoriteStatus(event: Event)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func addToFavorites<M1: Cuckoo.Matchable>(event: M1) -> Cuckoo.__DoNotUse<(Event), Void> where M1.MatchedType == Event {
            let matchers: [Cuckoo.ParameterMatcher<(Event)>] = [wrap(matchable: event) { $0 }]
            return cuckoo_manager.verify(
    """
    addToFavorites(event: Event)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func removeFromFavorites<M1: Cuckoo.Matchable>(event: M1) -> Cuckoo.__DoNotUse<(Event), Void> where M1.MatchedType == Event {
            let matchers: [Cuckoo.ParameterMatcher<(Event)>] = [wrap(matchable: event) { $0 }]
            return cuckoo_manager.verify(
    """
    removeFromFavorites(event: Event)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class FavoritesRepositoryProtocolStub: FavoritesRepositoryProtocol {
    

    

    
    
    
    
     func getFavoriteStatus(event: Event) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
    
    
    
    
     func toggleFavoriteStatus(event: Event)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func addToFavorites(event: Event)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func removeFromFavorites(event: Event)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: UpcomingSportEvents/Scenes/Events/EventList/EventListViewController.swift at 2023-02-13 22:53:47 +0000

//
//  EventListViewController.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import Cuckoo
@testable import UpcomingSportEvents

import Foundation
import UIKit






 class MockEventListViewController: EventListViewController, Cuckoo.ClassMock {
    
     typealias MocksType = EventListViewController
    
     typealias Stubbing = __StubbingProxy_EventListViewController
     typealias Verification = __VerificationProxy_EventListViewController

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: EventListViewController?

     func enableDefaultImplementation(_ stub: EventListViewController) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     override var mainTableView: UITableView! {
        get {
            return cuckoo_manager.getter("mainTableView",
                superclassCall:
                    
                    super.mainTableView
                    ,
                defaultCall: __defaultImplStub!.mainTableView)
        }
        
        set {
            cuckoo_manager.setter("mainTableView",
                value: newValue,
                superclassCall:
                    
                    super.mainTableView = newValue
                    ,
                defaultCall: __defaultImplStub!.mainTableView = newValue)
        }
        
    }
    
    
    
    
    
     override var loadingEventsLabel: UILabel! {
        get {
            return cuckoo_manager.getter("loadingEventsLabel",
                superclassCall:
                    
                    super.loadingEventsLabel
                    ,
                defaultCall: __defaultImplStub!.loadingEventsLabel)
        }
        
        set {
            cuckoo_manager.setter("loadingEventsLabel",
                value: newValue,
                superclassCall:
                    
                    super.loadingEventsLabel = newValue
                    ,
                defaultCall: __defaultImplStub!.loadingEventsLabel = newValue)
        }
        
    }
    
    
    
    
    
     override var errorStackView: UIStackView! {
        get {
            return cuckoo_manager.getter("errorStackView",
                superclassCall:
                    
                    super.errorStackView
                    ,
                defaultCall: __defaultImplStub!.errorStackView)
        }
        
        set {
            cuckoo_manager.setter("errorStackView",
                value: newValue,
                superclassCall:
                    
                    super.errorStackView = newValue
                    ,
                defaultCall: __defaultImplStub!.errorStackView = newValue)
        }
        
    }
    
    
    
    
    
     override var retryButton: UIButton! {
        get {
            return cuckoo_manager.getter("retryButton",
                superclassCall:
                    
                    super.retryButton
                    ,
                defaultCall: __defaultImplStub!.retryButton)
        }
        
        set {
            cuckoo_manager.setter("retryButton",
                value: newValue,
                superclassCall:
                    
                    super.retryButton = newValue
                    ,
                defaultCall: __defaultImplStub!.retryButton = newValue)
        }
        
    }
    
    
    
    
    
     override var viewModel: EventListViewModel? {
        get {
            return cuckoo_manager.getter("viewModel",
                superclassCall:
                    
                    super.viewModel
                    ,
                defaultCall: __defaultImplStub!.viewModel)
        }
        
        set {
            cuckoo_manager.setter("viewModel",
                value: newValue,
                superclassCall:
                    
                    super.viewModel = newValue
                    ,
                defaultCall: __defaultImplStub!.viewModel = newValue)
        }
        
    }
    
    
    
    
    
     override var viewConstructor: ViewConstructorProtocol? {
        get {
            return cuckoo_manager.getter("viewConstructor",
                superclassCall:
                    
                    super.viewConstructor
                    ,
                defaultCall: __defaultImplStub!.viewConstructor)
        }
        
        set {
            cuckoo_manager.setter("viewConstructor",
                value: newValue,
                superclassCall:
                    
                    super.viewConstructor = newValue
                    ,
                defaultCall: __defaultImplStub!.viewConstructor = newValue)
        }
        
    }
    
    
    
    
    
     override var collectionViewOffsets: [Int: CGFloat] {
        get {
            return cuckoo_manager.getter("collectionViewOffsets",
                superclassCall:
                    
                    super.collectionViewOffsets
                    ,
                defaultCall: __defaultImplStub!.collectionViewOffsets)
        }
        
        set {
            cuckoo_manager.setter("collectionViewOffsets",
                value: newValue,
                superclassCall:
                    
                    super.collectionViewOffsets = newValue
                    ,
                defaultCall: __defaultImplStub!.collectionViewOffsets = newValue)
        }
        
    }
    
    

    

    
    
    
    
     override func viewWillAppear(_ animated: Bool)  {
        
    return cuckoo_manager.call(
    """
    viewWillAppear(_: Bool)
    """,
            parameters: (animated),
            escapingParameters: (animated),
            superclassCall:
                
                super.viewWillAppear(animated)
                ,
            defaultCall: __defaultImplStub!.viewWillAppear(animated))
        
    }
    
    
    
    
    
     override func viewDidLoad()  {
        
    return cuckoo_manager.call(
    """
    viewDidLoad()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.viewDidLoad()
                ,
            defaultCall: __defaultImplStub!.viewDidLoad())
        
    }
    
    
    
    
    
     override func setupNavBar()  {
        
    return cuckoo_manager.call(
    """
    setupNavBar()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.setupNavBar()
                ,
            defaultCall: __defaultImplStub!.setupNavBar())
        
    }
    
    
    
    
    
     override func didTapProfileButton()  {
        
    return cuckoo_manager.call(
    """
    didTapProfileButton()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.didTapProfileButton()
                ,
            defaultCall: __defaultImplStub!.didTapProfileButton())
        
    }
    
    
    
    
    
     override func setupUI()  {
        
    return cuckoo_manager.call(
    """
    setupUI()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.setupUI()
                ,
            defaultCall: __defaultImplStub!.setupUI())
        
    }
    
    
    
    
    
     override func presentError(error: PresentableError)  {
        
    return cuckoo_manager.call(
    """
    presentError(error: PresentableError)
    """,
            parameters: (error),
            escapingParameters: (error),
            superclassCall:
                
                super.presentError(error: error)
                ,
            defaultCall: __defaultImplStub!.presentError(error: error))
        
    }
    
    
    
    
    
     override func didTapRetryButton(_ sender: Any)  {
        
    return cuckoo_manager.call(
    """
    didTapRetryButton(_: Any)
    """,
            parameters: (sender),
            escapingParameters: (sender),
            superclassCall:
                
                super.didTapRetryButton(sender)
                ,
            defaultCall: __defaultImplStub!.didTapRetryButton(sender))
        
    }
    
    

     struct __StubbingProxy_EventListViewController: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var mainTableView: Cuckoo.ClassToBeStubbedOptionalProperty<MockEventListViewController, UITableView> {
            return .init(manager: cuckoo_manager, name: "mainTableView")
        }
        
        
        
        
        var loadingEventsLabel: Cuckoo.ClassToBeStubbedOptionalProperty<MockEventListViewController, UILabel> {
            return .init(manager: cuckoo_manager, name: "loadingEventsLabel")
        }
        
        
        
        
        var errorStackView: Cuckoo.ClassToBeStubbedOptionalProperty<MockEventListViewController, UIStackView> {
            return .init(manager: cuckoo_manager, name: "errorStackView")
        }
        
        
        
        
        var retryButton: Cuckoo.ClassToBeStubbedOptionalProperty<MockEventListViewController, UIButton> {
            return .init(manager: cuckoo_manager, name: "retryButton")
        }
        
        
        
        
        var viewModel: Cuckoo.ClassToBeStubbedOptionalProperty<MockEventListViewController, EventListViewModel> {
            return .init(manager: cuckoo_manager, name: "viewModel")
        }
        
        
        
        
        var viewConstructor: Cuckoo.ClassToBeStubbedOptionalProperty<MockEventListViewController, ViewConstructorProtocol> {
            return .init(manager: cuckoo_manager, name: "viewConstructor")
        }
        
        
        
        
        var collectionViewOffsets: Cuckoo.ClassToBeStubbedProperty<MockEventListViewController, [Int: CGFloat]> {
            return .init(manager: cuckoo_manager, name: "collectionViewOffsets")
        }
        
        
        
        
        
        func viewWillAppear<M1: Cuckoo.Matchable>(_ animated: M1) -> Cuckoo.ClassStubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: animated) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEventListViewController.self, method:
    """
    viewWillAppear(_: Bool)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func viewDidLoad() -> Cuckoo.ClassStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockEventListViewController.self, method:
    """
    viewDidLoad()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func setupNavBar() -> Cuckoo.ClassStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockEventListViewController.self, method:
    """
    setupNavBar()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func didTapProfileButton() -> Cuckoo.ClassStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockEventListViewController.self, method:
    """
    didTapProfileButton()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func setupUI() -> Cuckoo.ClassStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockEventListViewController.self, method:
    """
    setupUI()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func presentError<M1: Cuckoo.Matchable>(error: M1) -> Cuckoo.ClassStubNoReturnFunction<(PresentableError)> where M1.MatchedType == PresentableError {
            let matchers: [Cuckoo.ParameterMatcher<(PresentableError)>] = [wrap(matchable: error) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEventListViewController.self, method:
    """
    presentError(error: PresentableError)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func didTapRetryButton<M1: Cuckoo.Matchable>(_ sender: M1) -> Cuckoo.ClassStubNoReturnFunction<(Any)> where M1.MatchedType == Any {
            let matchers: [Cuckoo.ParameterMatcher<(Any)>] = [wrap(matchable: sender) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEventListViewController.self, method:
    """
    didTapRetryButton(_: Any)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_EventListViewController: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var mainTableView: Cuckoo.VerifyOptionalProperty<UITableView> {
            return .init(manager: cuckoo_manager, name: "mainTableView", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var loadingEventsLabel: Cuckoo.VerifyOptionalProperty<UILabel> {
            return .init(manager: cuckoo_manager, name: "loadingEventsLabel", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var errorStackView: Cuckoo.VerifyOptionalProperty<UIStackView> {
            return .init(manager: cuckoo_manager, name: "errorStackView", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var retryButton: Cuckoo.VerifyOptionalProperty<UIButton> {
            return .init(manager: cuckoo_manager, name: "retryButton", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var viewModel: Cuckoo.VerifyOptionalProperty<EventListViewModel> {
            return .init(manager: cuckoo_manager, name: "viewModel", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var viewConstructor: Cuckoo.VerifyOptionalProperty<ViewConstructorProtocol> {
            return .init(manager: cuckoo_manager, name: "viewConstructor", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var collectionViewOffsets: Cuckoo.VerifyProperty<[Int: CGFloat]> {
            return .init(manager: cuckoo_manager, name: "collectionViewOffsets", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func viewWillAppear<M1: Cuckoo.Matchable>(_ animated: M1) -> Cuckoo.__DoNotUse<(Bool), Void> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: animated) { $0 }]
            return cuckoo_manager.verify(
    """
    viewWillAppear(_: Bool)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func viewDidLoad() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    viewDidLoad()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func setupNavBar() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    setupNavBar()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func didTapProfileButton() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    didTapProfileButton()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func setupUI() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    setupUI()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func presentError<M1: Cuckoo.Matchable>(error: M1) -> Cuckoo.__DoNotUse<(PresentableError), Void> where M1.MatchedType == PresentableError {
            let matchers: [Cuckoo.ParameterMatcher<(PresentableError)>] = [wrap(matchable: error) { $0 }]
            return cuckoo_manager.verify(
    """
    presentError(error: PresentableError)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func didTapRetryButton<M1: Cuckoo.Matchable>(_ sender: M1) -> Cuckoo.__DoNotUse<(Any), Void> where M1.MatchedType == Any {
            let matchers: [Cuckoo.ParameterMatcher<(Any)>] = [wrap(matchable: sender) { $0 }]
            return cuckoo_manager.verify(
    """
    didTapRetryButton(_: Any)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class EventListViewControllerStub: EventListViewController {
    
    
    
    
     override var mainTableView: UITableView! {
        get {
            return DefaultValueRegistry.defaultValue(for: (UITableView?).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var loadingEventsLabel: UILabel! {
        get {
            return DefaultValueRegistry.defaultValue(for: (UILabel?).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var errorStackView: UIStackView! {
        get {
            return DefaultValueRegistry.defaultValue(for: (UIStackView?).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var retryButton: UIButton! {
        get {
            return DefaultValueRegistry.defaultValue(for: (UIButton?).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var viewModel: EventListViewModel? {
        get {
            return DefaultValueRegistry.defaultValue(for: (EventListViewModel?).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var viewConstructor: ViewConstructorProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ViewConstructorProtocol?).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var collectionViewOffsets: [Int: CGFloat] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([Int: CGFloat]).self)
        }
        
        set { }
        
    }
    
    

    

    
    
    
    
     override func viewWillAppear(_ animated: Bool)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func viewDidLoad()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func setupNavBar()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func didTapProfileButton()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func setupUI()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func presentError(error: PresentableError)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func didTapRetryButton(_ sender: Any)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: UpcomingSportEvents/Scenes/Events/EventList/EventListViewModel.swift at 2023-02-13 22:53:47 +0000

//
//  EventListViewModel.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import Cuckoo
@testable import UpcomingSportEvents

import Foundation






 class MockEventListViewModelDelegate: EventListViewModelDelegate, Cuckoo.ProtocolMock {
    
     typealias MocksType = EventListViewModelDelegate
    
     typealias Stubbing = __StubbingProxy_EventListViewModelDelegate
     typealias Verification = __VerificationProxy_EventListViewModelDelegate

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: EventListViewModelDelegate?

     func enableDefaultImplementation(_ stub: EventListViewModelDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: Bool)  {
        
    return cuckoo_manager.call(
    """
    didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: Bool)
    """,
            parameters: (isLoadingSportingEvents),
            escapingParameters: (isLoadingSportingEvents),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: isLoadingSportingEvents))
        
    }
    
    
    
    
    
     func didFinishLoadingSportsAndEvents()  {
        
    return cuckoo_manager.call(
    """
    didFinishLoadingSportsAndEvents()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didFinishLoadingSportsAndEvents())
        
    }
    
    
    
    
    
     func didUpdateGetEventsBySportError(error: GetEventsBySportError?)  {
        
    return cuckoo_manager.call(
    """
    didUpdateGetEventsBySportError(error: GetEventsBySportError?)
    """,
            parameters: (error),
            escapingParameters: (error),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didUpdateGetEventsBySportError(error: error))
        
    }
    
    
    
    
    
     func didToggleExpansionForSection(section: Int, isExpanded: Bool)  {
        
    return cuckoo_manager.call(
    """
    didToggleExpansionForSection(section: Int, isExpanded: Bool)
    """,
            parameters: (section, isExpanded),
            escapingParameters: (section, isExpanded),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didToggleExpansionForSection(section: section, isExpanded: isExpanded))
        
    }
    
    
    
    
    
     func didUpdateFavoriteStatusForEventAt(section: Int, originalIndex: Int, newIndex: Int)  {
        
    return cuckoo_manager.call(
    """
    didUpdateFavoriteStatusForEventAt(section: Int, originalIndex: Int, newIndex: Int)
    """,
            parameters: (section, originalIndex, newIndex),
            escapingParameters: (section, originalIndex, newIndex),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didUpdateFavoriteStatusForEventAt(section: section, originalIndex: originalIndex, newIndex: newIndex))
        
    }
    
    

     struct __StubbingProxy_EventListViewModelDelegate: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func didUpdateIsLoadingSportingEvents<M1: Cuckoo.Matchable>(isLoadingSportingEvents: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: isLoadingSportingEvents) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEventListViewModelDelegate.self, method:
    """
    didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: Bool)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func didFinishLoadingSportsAndEvents() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockEventListViewModelDelegate.self, method:
    """
    didFinishLoadingSportsAndEvents()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func didUpdateGetEventsBySportError<M1: Cuckoo.OptionalMatchable>(error: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(GetEventsBySportError?)> where M1.OptionalMatchedType == GetEventsBySportError {
            let matchers: [Cuckoo.ParameterMatcher<(GetEventsBySportError?)>] = [wrap(matchable: error) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEventListViewModelDelegate.self, method:
    """
    didUpdateGetEventsBySportError(error: GetEventsBySportError?)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func didToggleExpansionForSection<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(section: M1, isExpanded: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Int, Bool)> where M1.MatchedType == Int, M2.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Int, Bool)>] = [wrap(matchable: section) { $0.0 }, wrap(matchable: isExpanded) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEventListViewModelDelegate.self, method:
    """
    didToggleExpansionForSection(section: Int, isExpanded: Bool)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func didUpdateFavoriteStatusForEventAt<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(section: M1, originalIndex: M2, newIndex: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(Int, Int, Int)> where M1.MatchedType == Int, M2.MatchedType == Int, M3.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int, Int, Int)>] = [wrap(matchable: section) { $0.0 }, wrap(matchable: originalIndex) { $0.1 }, wrap(matchable: newIndex) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEventListViewModelDelegate.self, method:
    """
    didUpdateFavoriteStatusForEventAt(section: Int, originalIndex: Int, newIndex: Int)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_EventListViewModelDelegate: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func didUpdateIsLoadingSportingEvents<M1: Cuckoo.Matchable>(isLoadingSportingEvents: M1) -> Cuckoo.__DoNotUse<(Bool), Void> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: isLoadingSportingEvents) { $0 }]
            return cuckoo_manager.verify(
    """
    didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: Bool)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func didFinishLoadingSportsAndEvents() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    didFinishLoadingSportsAndEvents()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func didUpdateGetEventsBySportError<M1: Cuckoo.OptionalMatchable>(error: M1) -> Cuckoo.__DoNotUse<(GetEventsBySportError?), Void> where M1.OptionalMatchedType == GetEventsBySportError {
            let matchers: [Cuckoo.ParameterMatcher<(GetEventsBySportError?)>] = [wrap(matchable: error) { $0 }]
            return cuckoo_manager.verify(
    """
    didUpdateGetEventsBySportError(error: GetEventsBySportError?)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func didToggleExpansionForSection<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(section: M1, isExpanded: M2) -> Cuckoo.__DoNotUse<(Int, Bool), Void> where M1.MatchedType == Int, M2.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Int, Bool)>] = [wrap(matchable: section) { $0.0 }, wrap(matchable: isExpanded) { $0.1 }]
            return cuckoo_manager.verify(
    """
    didToggleExpansionForSection(section: Int, isExpanded: Bool)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func didUpdateFavoriteStatusForEventAt<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(section: M1, originalIndex: M2, newIndex: M3) -> Cuckoo.__DoNotUse<(Int, Int, Int), Void> where M1.MatchedType == Int, M2.MatchedType == Int, M3.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int, Int, Int)>] = [wrap(matchable: section) { $0.0 }, wrap(matchable: originalIndex) { $0.1 }, wrap(matchable: newIndex) { $0.2 }]
            return cuckoo_manager.verify(
    """
    didUpdateFavoriteStatusForEventAt(section: Int, originalIndex: Int, newIndex: Int)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class EventListViewModelDelegateStub: EventListViewModelDelegate {
    

    

    
    
    
    
     func didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: Bool)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func didFinishLoadingSportsAndEvents()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func didUpdateGetEventsBySportError(error: GetEventsBySportError?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func didToggleExpansionForSection(section: Int, isExpanded: Bool)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func didUpdateFavoriteStatusForEventAt(section: Int, originalIndex: Int, newIndex: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}




