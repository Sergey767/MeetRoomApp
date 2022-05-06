//
//  DeleteRoomsTableViewController.swift
//  MeetRoomApp
//
//  Created by Сергей Горячев on 06.05.2022.
//

import UIKit

class DeleteRoomsTableViewController: UITableViewController {
    
    var rooms = [Room]()

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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            rooms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
