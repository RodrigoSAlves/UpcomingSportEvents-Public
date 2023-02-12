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
            return AppIcon.sportIconSoccer
        case "BASK":
            return AppIcon.sportIconBasketball
        case "TENN":
            return AppIcon.sportIconTennis
        case "TABL":
            return AppIcon.sportIconTableTennis
        case "VOLL":
            return AppIcon.sportIconVolleyball
        case "ESPS":
            return AppIcon.sportIconESports
        case "ICEH":
            return AppIcon.sportIconIceHockey
        case "HAND":
            return AppIcon.sportIconHandball
        case "SNOO":
            return AppIcon.sportIconSnooker
        case "BADM":
            return AppIcon.sportIconBadminton
        default:
            return AppIcon.sportIconDefault
        }
    }
}
