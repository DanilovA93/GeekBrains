//
//  MyGroupsTableViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 13.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit


class MyGroupsTableViewController: UITableViewController, UISearchBarDelegate {
        
    @IBOutlet weak var searchBar: UISearchBar!
    
    var myGroups: [Group] = [
        Group(id: 1, name: "one", avatar: UIImage(named: "group1")!),
        Group(id: 2, name: "two", avatar: UIImage(named: "group2")!)
    ]
    
    var filteredMyGroups = [Group]()
    var isSearching: Bool = false
    
    @IBAction func followGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "followGroup" {
            let allGroupsVC = segue.source as! AllGroupsTableViewController
                        
            if let indexPath = allGroupsVC.tableView.indexPathForSelectedRow {
                let newGroup = allGroupsVC.allGroups[indexPath.row]
                
                if !myGroups.contains(newGroup) {
                    self.myGroups.append(newGroup)
                    tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func unfollowGroup(_ sender: UIButton) {
        if let cell = sender.superview?.superview as? UITableViewCell {
            let i = tableView.indexPath(for: cell)!.row
            myGroups.remove(at: i)
            
            tableView.reloadSections(IndexSet(integer: 0), with: .fade)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return isSearching ? filteredMyGroups.count : myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupsCell", for: indexPath) as! MyGroupsTableViewCell
        
        let myGroupList = isSearching ? filteredMyGroups : myGroups
        
        cell.avatarImageView.image = myGroupList[indexPath.row].avatar
        cell.nameLabel.text = myGroupList[indexPath.row].name

        // Configure the cell...

        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.isSearching = !searchText.isEmpty
        self.filteredMyGroups =
            myGroups.filter { (group) -> Bool in
                group.name.lowercased().contains(searchText.lowercased())
            }
                                
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
}
