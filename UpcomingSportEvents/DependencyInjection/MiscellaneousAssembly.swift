//
//  MiscellaneousAssembly.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import Swinject

final class MiscellaneousAssembly: Assembly {

    func assemble(container: Container) {
        container.register(ViewConstructorProtocol.self) { _ in
            return ViewConstructor()
        }
    }
}
