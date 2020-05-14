//
//  AllGroupsTableViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 13.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    let allGroups: [Group] = [
        Group(id: 1, name: "one", avatar: UIImage(named: "group1")!),
        Group(id: 2, name: "two", avatar: UIImage(named: "group2")!),
        Group(id: 3, name: "three", avatar: UIImage(named: "group3")!),
        Group(id: 4, name: "four", avatar: UIImage(named: "group4")!),
        Group(id: 5, name: "five", avatar: UIImage(named: "group5")!),
        Group(id: 6, name: "six", avatar: UIImage(named: "group6")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupsCell", for: indexPath) as! AllGroupsTableViewCell
        
        cell.avatarImageView.image = allGroups[indexPath.row].avatar
        cell.nameLabel.text = allGroups[indexPath.row].name
        // Configure the cell...
        
        return cell
    }
}
