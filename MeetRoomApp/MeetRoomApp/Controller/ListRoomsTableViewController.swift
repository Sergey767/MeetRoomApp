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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

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
//            deleteRoomsTableViewController.nameRoom = room.nameRoom
//            deleteRoomsTableViewController.membersRoom = room.membersRoom
            deleteRoomsTableViewController.rooms = [room]
            
//            if let friendValues = myFriendsDictionary[friendKey] {
//                let friendsPhoto = friendValues[indexPath.row].imagePhoto
//                let friendTitle = friendValues[indexPath.row].name + " " + friendValues[indexPath.row].surname
//
//                photoController.photo = friendsPhoto
//                photoController.friendTitle = friendTitle
//            }
        
        }
    }
}
