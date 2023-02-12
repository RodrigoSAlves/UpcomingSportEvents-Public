//
//  DIContainer.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import Swinject

final class DIContainer {
    static let shared = DIContainer()

    let container: Container = Container()
    let assembler: Assembler

    init() {
        assembler = Assembler(
            [
                SceneAssembly(),
                NetworkingAssembly(),
                RepositoryAssembly(),
                PersistenceAssembly()
            ],
            container: container
        )
    }

    func resolve<T>() -> T {
        guard let resolvedType = container.resolve(T.self) else {
            fatalError("Could not resolve dependency (1)")
        }
        return resolvedType
    }

    func resolve<T>(registrationName: String?) -> T {
        guard let resolvedType = container.resolve(T.self, name: registrationName) else {
            fatalError("Could not resolve dependency (2)")
        }
        return resolvedType
    }

    func resolve<T, Arg>(argument: Arg) -> T {
        guard let resolvedType = container.resolve(T.self, argument: argument) else {
            fatalError("Could not resolve dependency (3)")
        }
        return resolvedType
    }

    func resolve<T, Arg1, Arg2>(arguments arg1: Arg1, _ arg2: Arg2) -> T {
        guard let resolvedType = container.resolve(T.self, arguments: arg1, arg2) else {
            fatalError("Could not resolve dependency (4)")
        }
        return resolvedType
    }

    func resolve<T, Arg>(name: String?, argument: Arg) -> T {
        guard let resolvedType = container.resolve(T.self, name: name, argument: argument) else {
            fatalError("Could not resolve dependency (5)")
        }
        return resolvedType
    }

    func resolve<T, Arg1, Arg2>(name: String?, arguments arg1: Arg1, _ arg2: Arg2) -> T {
        guard let resolvedType = container.resolve(T.self, name: name, arguments: arg1, arg2) else {
            fatalError("Could not resolve dependency (6)")
        }
        return resolvedType
    }
}
