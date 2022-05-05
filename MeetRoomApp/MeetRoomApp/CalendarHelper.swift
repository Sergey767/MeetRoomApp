//
//  CalendarHelper.swift
//  MeetRoomApp
//
//  Created by Сергей Горячев on 03.05.2022.
//

import Foundation
import UIKit

class CalendarHelper {
    
    let calendar = Calendar.current
    
    func plusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date) ?? Date()
    }
    
    func minusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date) ?? Date()
    }
    
    func daysInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)
        return range?.count ?? 0
    }
    
    func dayOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day ?? 0
    }
    
    func firstOfMonth(date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components) ?? Date()
    }
    
    func weekDay(date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return (components.weekday ?? 0) - 1
    }
    
    func timeString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func hourFromDate(date: Date) -> Int {
        let components = calendar.dateComponents([.hour], from: date)
        return components.hour ?? 0
    }
    
    func monthString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
    
    func yearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    func addDays(date: Date, days: Int) -> Date {
        return calendar.date(byAdding: .day, value: days, to: date) ?? Date()
    }
    
    func sundayForDate(date: Date) -> Date {
        var current = date
        let oneWeekAgo = addDays(date: current, days: -7)
        
        while(current > oneWeekAgo) {
            let currentWeekDay = calendar.dateComponents([.weekday], from: current).weekday
            if(currentWeekDay == 1) {
                return current
            }
            current = addDays(date: current, days: -1)
        }
        return current
    }
}
