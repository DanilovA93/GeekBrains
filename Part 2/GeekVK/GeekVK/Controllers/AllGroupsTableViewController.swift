//
//  AllGroupsTableViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 13.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit


class AllGroupsTableViewController: UITableViewController, UISearchBarDelegate {
            
    @IBOutlet weak var searchBar: UISearchBar!
    
    let allGroups: [Group] = [
        Group(id: 1, name: "one", avatar: UIImage(named: "group1")!),
        Group(id: 2, name: "two", avatar: UIImage(named: "group2")!),
        Group(id: 3, name: "three", avatar: UIImage(named: "group3")!),
        Group(id: 4, name: "four", avatar: UIImage(named: "group4")!),
        Group(id: 5, name: "five", avatar: UIImage(named: "group5")!),
        Group(id: 6, name: "six", avatar: UIImage(named: "group6")!)
    ]
    
    var filteredAllGroups = [Group]()
    var isSearching: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return isSearching ? filteredAllGroups.count : allGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupsCell", for: indexPath) as! AllGroupsTableViewCell
        
        let myGroupList = isSearching ? filteredAllGroups : allGroups
        
        cell.avatarImageView.image = myGroupList[indexPath.row].avatar
        cell.nameLabel.text = myGroupList[indexPath.row].name
        // Configure the cell...
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.isSearching = !searchText.isEmpty
        self.filteredAllGroups =
            allGroups.filter { (group) -> Bool in
                group.name.lowercased().contains(searchText.lowercased())
            }
                                
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
}
