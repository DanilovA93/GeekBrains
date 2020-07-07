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
             numberOfViews: 4,
             numberOfLikes: 7,
             avatar: UIImage(named: "group1")!,
             photos: [UIImage(named: "man1")!]),
        News(id: 1, name: "Secont news",
             text: "This is my first news",
             numberOfViews: 42,
             numberOfLikes: 23,
             avatar: UIImage(named: "group6")!,
             photos: [UIImage(named: "mouse")!]),
        News(id: 1, name: "Third news",
             text: "This is my first news",
             numberOfViews: 13,
             numberOfLikes: 0,
             avatar: UIImage(named: "group2")!,
             photos: [UIImage(named: "bob")!])
    ]
    
    private var tableCellNumber: Int?

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
        cell.viewsLabel.text = String(news[indexPath.row].numberOfViews)
        cell.newsLike.allLikes = news[indexPath.row].numberOfLikes
        
        cell.newsLike.reloadInputViews()
        
        tableCellNumber = indexPath.row

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsPhotoCell", for: indexPath) as! NewsPhotoCollectionViewCell
        
        let collectionFrame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: self.tableView.frame.width)
        collectionView.frame = collectionFrame
        
        cell.frame = collectionFrame
        cell.image.image = news[self.tableCellNumber!].photos[0]
        
        return cell
    }
}
