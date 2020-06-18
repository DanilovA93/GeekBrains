//
//  FriendsPhotoCollectionViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 14.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class FriendsPhotoCollectionViewController: UICollectionViewController {
    
    let itemsPerRow: CGFloat = 1
    var selectedFriend: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedFriend?.avatar!.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendsPhotoCell", for: indexPath) as! FriendsPhotoCollectionViewCell
                
        cell.avatarImageView.image = self.selectedFriend!.avatar![indexPath.row]
        return cell
    }

    // MARK: UICollectionViewDelegate
}
