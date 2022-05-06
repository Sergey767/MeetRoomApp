//
//  Event.swift
//  MeetRoomApp
//
//  Created by Сергей Горячев on 03.05.2022.
//

import Foundation

var eventList = [Event]()

class Event {
    
    var id: Int?
    var name: String?
    var startDate: Date?
    var endDate: Date?
    
    func eventsForDate(date: Date) -> [Event] {
        var daysEvents = [Event]()
        for event in eventList {
            if(Calendar.current.isDate(event.startDate ?? Date(), inSameDayAs: date)) {
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
}
