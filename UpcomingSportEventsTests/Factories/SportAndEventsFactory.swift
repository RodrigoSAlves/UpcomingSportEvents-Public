//
//  SportAndEventsFactory.swift
//  UpcomingSportEventsTests
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import Foundation
@testable import UpcomingSportEvents

struct SportAndEventsFactory {

    func makeDefaultSportsAndEventsData() -> [SportData] {
        return [
            SportData(
                id: "FOOT",
                name: "SOCCER",
                events: [
                    EventData(
                        id: "29135390",
                        name: "Juventus FC - Paris Saint-Germain",
                        sportId: "FOOT",
                        startTime: Date(timeIntervalSince1970: 1667447160)
                    ),
                    EventData(
                        id: "29135368",
                        name: "AC Milan - FC Red Bull Salzburg",
                        sportId: "FOOT",
                        startTime: Date(timeIntervalSince1970: 1672026900)
                    ),
                    EventData(
                        id: "29135365",
                        name: "Maccabi Haifa - SL Benfica",
                        sportId: "FOOT",
                        startTime: Date(timeIntervalSince1970: 1669743180)
                    )
                ]
            ),
            SportData(
                id: "SNOO",
                name: "SNOOKER",
                events: [
                    EventData(
                        id: "29135390",
                        name: "Judd Trump - Mark Allen",
                        sportId: "SNOO",
                        startTime: Date(timeIntervalSince1970: 1677214560)
                    )
                ]
            )
        ]
    }
}
