//
//  ListRoomsTableViewController.swift
//  MeetRoomApp
//
//  Created by Сергей Горячев on 06.05.2022.
//

import UIKit

class ListRoomsTableViewController: UITableViewController {
    
    var rooms: [Room] = [
        Room(nameRoom: "Плановое совещание (конференция)", membersRoom: "Пономарева А. Д. \nРоманов М. А. \nКузнецов П. А."),
        Room(nameRoom: "Планерка", membersRoom: "Морозов А. И. \nРоманов М. А. \nТихонова В. Л."),
        Room(nameRoom: "Позвонить начальнику отдела сбыта", membersRoom: "Соколова В. Д."),
        Room(nameRoom: "Встреча с гендиректором", membersRoom: "Ефремов Д. Р. \nКалинина С. Б."),
        Room(nameRoom: "Передать кладовщику информацию", membersRoom: "Абрамова Н. А.")
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

    // MARK: - Navigation

    @IBAction func addRoom(segue: UIStoryboardSegue) {
            if let controller = segue.source as? AddRoomsTableViewController,
                let indexPath = controller.tableView.indexPathForSelectedRow {
                let room = controller.rooms[indexPath.row]
                
                guard !rooms.contains(where: { $0.nameRoom == room.nameRoom} ) else {return}
                
                rooms.append(room)
                let newIndexPath = IndexPath(item: rooms.count - 1, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DeleteSegue",
            let deleteRoomsTableViewController = segue.destination as? DeleteRoomsTableViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            
             let room = rooms[indexPath.row]
            deleteRoomsTableViewController.rooms = [room]
        }
    }
}
