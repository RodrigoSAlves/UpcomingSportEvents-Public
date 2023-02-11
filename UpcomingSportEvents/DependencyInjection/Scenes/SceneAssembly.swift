//
//  SceneAssembly.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import Swinject

final class SceneAssembly: Assembly {
    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            EventListSceneAssembly()
        ]

        assemblies.forEach { $0.assemble(container: container) }
    }
}
