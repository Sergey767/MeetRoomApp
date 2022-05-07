//
//  EventEditViewController.swift
//  MeetRoomApp
//
//  Created by Сергей Горячев on 02.05.2022.
//

import UIKit

class EventEditViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startDatePicker.date = selectedDate
        startDatePicker.minimumDate = Calendar.current.date(byAdding: .minute, value: 30, to: Date())
        startDatePicker.maximumDate = Calendar.current.date(byAdding: .hour, value: 24, to: Date())
        endDatePicker.date = selectedDate
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        let newEvent = Event()
        newEvent.id = eventList.count
        newEvent.name = nameTextField.text
        newEvent.startDate = startDatePicker.date
        newEvent.endDate = endDatePicker.date
        eventList.append(newEvent)
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(Event().eventsForDate(date: selectedDate))
            
            UserDefaults.standard.set(data, forKey: "myEventsKey")
            UserDefaults.standard.synchronize()
        } catch {
            print("Unable to Encode Note (\(error))")
        }
        
        navigationController?.popViewController(animated: true)
    }
}
