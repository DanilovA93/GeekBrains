//
//  NewsTableViewCell.swift
//  GeekVK
//
//  Created by Антон Данилов on 26.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: AvatarView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var newsTextLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var newsLike: LikeControl!
    @IBOutlet weak var newsPhotoCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension NewsTableViewCell {
    func setCollectionViewDataSourceDelegate <D: UICollectionViewDelegate & UICollectionViewDataSource>
        (_ datasourceDelegate: D, forRow row: Int)
    {
        newsPhotoCollectionView.delegate = datasourceDelegate
        newsPhotoCollectionView.dataSource = datasourceDelegate
        
        newsPhotoCollectionView.reloadData()
    }
}
