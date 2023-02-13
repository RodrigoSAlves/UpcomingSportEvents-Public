//
//  UIDate.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import Foundation

extension Date {

    /// Returns a string with the hours, minutes and seconds until the provided date in the format hh:mm:ss
    /// If the provided date is in the past or something fails, it returns nil
    /// - Parameter until: The date to compare
    /// - Returns: The hours, minutes and seconds until the `date` in hh:mm:ss format
    func getHoursMinutesSecondsRemaining(until date: Date) -> String? {
        guard date > self else {
            return nil
        }

        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: self, to: date)

        guard let hours = components.hour, let minutes = components.minute, let seconds = components.second else {
            return nil
        }

        let formattedHours = String(format: "%02d", hours)
        let formattedMinutes = String(format: "%02d", minutes)
        let formattedSeconds = String(format: "%02d", seconds)

        return "\(formattedHours):\(formattedMinutes):\(formattedSeconds)"
    }
}
