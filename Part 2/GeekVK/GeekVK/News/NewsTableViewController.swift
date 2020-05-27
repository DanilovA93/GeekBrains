//
//  NewsTableViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 26.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let news: [News] = [
        News(id: 1, name: "First news",
             text: "This is my first news This is my first news This is my first news This is my first news This is my first news This is my first news This is my first news This is my first news",
             numberOfViewsL: 4,
             avatar: UIImage(named: "group1")!,
             photos: [UIImage(named: "cat")!]),
        News(id: 1, name: "First news", text: "This is my first news", numberOfViewsL: 4, avatar: UIImage(named: "group1")!, photos: [UIImage(named: "cat")!]),
        News(id: 1, name: "First news", text: "This is my first news", numberOfViewsL: 4, avatar: UIImage(named: "group1")!, photos: [UIImage(named: "cat")!])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        cell.avatar.image = news[indexPath.row].avatar
        cell.nameLabel.text = news[indexPath.row].name
        cell.newsTextLabel.text = news[indexPath.row].text

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsPhotoCell", for: indexPath) as! NewsPhotoCollectionViewCell
        cell.image.image = news[indexPath.row].photos[0]
        
        return cell
    }

}
