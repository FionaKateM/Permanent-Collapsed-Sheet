//
//  IntExtension.swift
//  demo_collapsedSheetAnimation
//
//  Created by Fiona Kate Morgan on 06/07/2024.
//

import Foundation

extension Int {
    func weekday() -> String {
        let weekdayInt = self % 7
        switch weekdayInt {
        case 0:
            return "Monday"
        case 1:
            return "Tuesday"
        case 2:
            return "Wednesday"
        case 3:
            return "Thursday"
        case 4:
            return "Friday"
        case 5:
            return "Saturday"
        case 6:
            return "Sunday"
            
        default:
            return "no weekday"
        }
    }
    
    func shortWeekday() -> String {
        let weekdayInt = self % 7
        switch weekdayInt {
        case 0:
            return "Mon"
        case 1:
            return "Tue"
        case 2:
            return "Wed"
        case 3:
            return "Thu"
        case 4:
            return "Fri"
        case 5:
            return "Sat"
        case 6:
            return "Sun"
            
        default:
            return "no weekday"
        }
    }
}
