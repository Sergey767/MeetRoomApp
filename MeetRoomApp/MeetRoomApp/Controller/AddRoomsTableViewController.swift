//
//  AddRoomsTableViewController.swift
//  MeetRoomApp
//
//  Created by Сергей Горячев on 06.05.2022.
//

import UIKit

class AddRoomsTableViewController: UITableViewController {
    
    var rooms: [Room] = [
        Room(nameRoom: "Передать список задач", membersRoom: "Лебедева А. К. \nСорокин И. И."),
        Room(nameRoom: "Передать Кузнецову отчет по проекту", membersRoom: "Кузнецов П. А."),
        Room(nameRoom: "Подготовить презентацию", membersRoom: "Куликов А. Т. \n Беляев Е. М. \nАникина А. Т."),
        Room(nameRoom: "Полготовить отчет о продажах", membersRoom: "Егорова Е. M. \nЕрмилов Р. А"),
        Room(nameRoom: "Встреча с клиентами", membersRoom: "Королева А. Р. \nЛебедев Д. И.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rooms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCellID", for: indexPath) as! RoomCell

        cell.nameRoomLabel.text = rooms[indexPath.row].nameRoom
        cell.membersRoomLabel.text = "Участники переговоров: \n" + rooms[indexPath.row].membersRoom
        
        return cell
    }
}
