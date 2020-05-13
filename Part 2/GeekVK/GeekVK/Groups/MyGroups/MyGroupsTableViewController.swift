//
//  MyGroupsTableViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 13.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    let myGroups: [Group] = [
        Group(id: 1, name: "one", avatar: UIImage(named: "group1")!),
        Group(id: 2, name: "two", avatar: UIImage(named: "group2")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupsCell", for: indexPath) as! MyGroupsTableViewCell
        
        cell.avatarImageView.image = myGroups[indexPath.row].avatar
        cell.nameLabel.text = myGroups[indexPath.row].name

        // Configure the cell...

        return cell
    }
}
