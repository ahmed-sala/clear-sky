//
//  TimeHelper.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 10/06/2026.
//

import Foundation

enum TimeHelper {

    static func backgroundImageName() -> String {
        let hour = Calendar.current.component(.hour, from: Date())

        return (5..<18).contains(hour)
            ? "morning_background"
            : "evening_background"
    }
}
