//
//  FriendsPhotoCollectionViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 14.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriendsPhotoCollectionViewController: UICollectionViewController {
    
    var selectedFriend: User?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendsPhotoCell", for: indexPath) as! FriendsPhotoCollectionViewCell
                
        cell.avatarImageView.image = self.selectedFriend!.avatar
        // Configure the cell
        return cell
    }

    // MARK: UICollectionViewDelegate
}
