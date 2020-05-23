//
//  FriendsTableViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 13.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
            
    let friends: [User] = [
        User(id: 1, email: "user1", password: "123", name: "Tom", avatar: UIImage(named: "user1")!),
        User(id: 2, email: "user2", password: "321", name: "Jerry", avatar: UIImage(named: "user2")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! FriendsTableViewCell
        
        
        cell.avatar.image = friends[indexPath.row].avatar
        cell.nameLabel.text = friends[indexPath.row].name

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            let i = tableView.indexPath(for: cell)!.row
            let targetVC = segue.destination as! FriendsPhotoCollectionViewController
            
            targetVC.selectedFriend = friends[i]
        }
    }
}
