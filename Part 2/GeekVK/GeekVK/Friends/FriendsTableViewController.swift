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
    let friends: [User] = [
        User(id: 1, email: "1", password: "1", firstName: "Jessie", lastName: "Howard", avatar: [UIImage(named: "mouse")!]),
        User(id: 2, email: "user2", password: "321", firstName: "Elisabeth", lastName: "Peters", avatar: [UIImage(named: "man1")!]),
        User(id: 3, email: "user3", password: "321", firstName: "David", lastName: "Preston", avatar: [UIImage(named: "bob")!]),
        User(id: 4, email: "user4", password: "321", firstName: "Lindsey", lastName: "Day", avatar: [UIImage(named: "cat")!]),
        User(id: 5, email: "user5", password: "321", firstName: "Harry", lastName: "Quinn", avatar: [UIImage(named: "man2")!]),
        User(id: 6, email: "user6", password: "321", firstName: "Imogen", lastName: "Strickland", avatar: [UIImage(named: "mouse")!]),
        User(id: 7, email: "user7", password: "321", firstName: "Ann", lastName: "Strick", avatar: [UIImage(named: "cat")!]),
        User(id: 8, email: "user8", password: "321", firstName: "Felicity", lastName: "Lu", avatar: [UIImage(named: "bob")!]),
        User(id: 8, email: "user9", password: "321", firstName: "Jack", lastName: "Black", avatar: [UIImage(named: "man1")!, UIImage(named: "man2")!]),
        User(id: 8, email: "user10", password: "321", firstName: "Bruce", lastName: "Lee", avatar: [UIImage(named: "man2")!])
    ]
    
    var filteredFriends = [User]()
    var isSearching: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
                
        updateFriendSectionsTitle()
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
            cell.nameLabel.text = "\(friendValues[indexPath.row].firstName) \(friendValues[indexPath.row].lastName)"
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
                
                let targetVC = segue.destination as! FriendsPhotoCollectionViewController
                targetVC.selectedFriend = friendValues[i]
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.isSearching = !searchText.isEmpty
        self.filteredFriends =
            friends.filter { (friend) -> Bool in
                friend.firstName.lowercased().contains(searchText.lowercased())
                || friend.lastName.lowercased().contains(searchText.lowercased())
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
            let friendKey = String(friend.lastName.prefix(1))
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
