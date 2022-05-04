//
//  EventEditViewController.swift
//  MeetRoomApp
//
//  Created by Сергей Горячев on 02.05.2022.
//

import UIKit

class EventEditViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.date = selectedDate
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        let newEvent = Event()
        newEvent.id = eventList.count
        newEvent.name = nameTextField.text
        newEvent.date = datePicker.date
        eventList.append(newEvent)
        navigationController?.popViewController(animated: true)
    }
}
