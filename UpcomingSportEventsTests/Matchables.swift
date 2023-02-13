//
//  Matchables.swift
//  UpcomingSportEventsTests
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import Cuckoo
import Foundation
@testable import UpcomingSportEvents

func anyOptionalValue<T>() -> ParameterMatcher<T?> {
    return ParameterMatcher()
}

func anyValue<T>() -> ParameterMatcher<T> {
    return ParameterMatcher()
}

func nilValue<T>() -> ParameterMatcher<T?> {
    return ParameterMatcher { $0 == nil }
}
