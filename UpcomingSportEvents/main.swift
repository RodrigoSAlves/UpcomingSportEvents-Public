//
//  main.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import Foundation
import UIKit

// AppDelegate Initialization based on https://www.marcosantadev.com/fake-appdelegate-unit-testing-swift/
// Additional tweaks based on https://stackoverflow.com/a/74122642

var appDelegateClass: String?

if NSClassFromString("XCTestCase") != nil {
    appDelegateClass = nil
} else {
    appDelegateClass = NSStringFromClass(AppDelegate.self)
}

_ = UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    appDelegateClass
)
