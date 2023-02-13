//
//  SportIcon.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 12/02/2023.
//

import UIKit

struct SportIcon {
    static func getMainIcon(for sport: Sport) -> UIImage {
        switch sport.id {
        case "FOOT":
            return .sportIconSoccer
        case "BASK":
            return .sportIconBasketball
        case "TENN":
            return .sportIconTennis
        case "TABL":
            return .sportIconTableTennis
        case "VOLL":
            return .sportIconVolleyball
        case "ESPS":
            return .sportIconESports
        case "ICEH":
            return .sportIconIceHockey
        case "HAND":
            return .sportIconHandball
        case "SNOO":
            return .sportIconSnooker
        case "BADM":
            return .sportIconBadminton
        default:
            return .sportIconDefault
        }
    }
}
