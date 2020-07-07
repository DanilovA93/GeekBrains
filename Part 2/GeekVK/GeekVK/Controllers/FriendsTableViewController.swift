//
//  FriendsTableViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 13.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
        
    var friendDictionary = [String: [User]]()
    var friendSectionTitles = [String]()
    var friends = [User]()
    
    var filteredFriends = [User]()
    var isSearching: Bool = false

    let dispathcGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                                
        WebRequest.getFriends {
            self.friends = $0
            self.updateFriendSectionsTitle()
            
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendSectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let friendKey = friendSectionTitles[section]
        if let friendValues = friendDictionary[friendKey] {
            return friendValues.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! FriendsTableViewCell
        
        let friendKey = friendSectionTitles[indexPath.section]
        if let friendValues = friendDictionary[friendKey] {
            cell.avatar.image = friendValues[indexPath.row].avatar![0]
            cell.nameLabel.text = "\(friendValues[indexPath.row].firstName!) \(friendValues[indexPath.row].lastName!)"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendSectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.clear
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendSectionTitles
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            
            let friendKey = friendSectionTitles[tableView.indexPath(for: cell)!.section]
            if let friendValues = friendDictionary[friendKey] {
                let i = tableView.indexPath(for: cell)!.row
                
                let targetVC = segue.destination as! FriendsPhotoViewController
                targetVC.user = friendValues[i]
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.isSearching = !searchText.isEmpty
        self.filteredFriends =
            friends.filter { (friend) -> Bool in
                friend.firstName!.lowercased().contains(searchText.lowercased())
                || friend.lastName!.lowercased().contains(searchText.lowercased())
            }
                
        updateFriendSectionsTitle()
        
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    
    private func updateFriendSectionsTitle() {
        friendDictionary.removeAll()
        friendSectionTitles.removeAll()
        
        let friendList = isSearching ? filteredFriends : friends
        
        for friend in friendList {
            let friendKey = String(friend.lastName!.prefix(1))
            if var friendValues = friendDictionary[friendKey] {
                friendValues.append(friend)
                friendDictionary[friendKey] = friendValues
            } else {
                friendDictionary[friendKey] = [friend]
            }
        }
        
        friendSectionTitles = [String](friendDictionary.keys)
        friendSectionTitles = friendSectionTitles.sorted(by: {$0 < $1})
    }
}
