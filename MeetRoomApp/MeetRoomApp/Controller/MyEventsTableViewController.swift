//
//  MyEventsTableViewController.swift
//  MeetRoomApp
//
//  Created by Сергей Горячев on 07.05.2022.
//

import UIKit

class MyEventsTableViewController: UITableViewController {
    
    var myEvents = [Event]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "my events"
    }
    
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear (true)
        
        let loginDetails = UserDefaults.standard.value(forKey: "login")
        let passwordDetails = UserDefaults.standard.value(forKey: "password")
        
        if loginDetails != nil && passwordDetails != nil {
            
            if let data = UserDefaults.standard.data(forKey: "myEventsKey") {
                do {
                    let decoder = JSONDecoder()
                    let myEvents = try decoder.decode([Event].self, from: data)
                    self.myEvents = myEvents
                } catch {
                    print("Unable to Decode Note (\(error))")
                }
            }
        }
        
        tableView.reloadData()
    }


    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myEvents.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! EventCell
        let event = myEvents[indexPath.row]
        let eventName = event.name ?? ""
        cell.eventLabel.text = eventName + "\n" + "Начало: " + CalendarHelper().timeString(date: event.startDate ?? Date()) + "\n" + "Конец:" + CalendarHelper().timeString(date: event.endDate ?? Date())
        return cell
    }
}
