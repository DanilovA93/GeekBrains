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
    
    var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupsCell", for: indexPath) as! AllGroupsTableViewCell
                
        cell.avatarImageView.image = groups[indexPath.row].avatar
        cell.nameLabel.text = groups[indexPath.row].name
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.async{
            WebRequest.getGroupsForSearch(q: searchText) {
                        self.groups = $0
                        
                        self.tableView.reloadData()
                    }
        }
    }
}
