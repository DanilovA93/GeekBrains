//
//  NewsPhotoCollectionViewCell.swift
//  GeekVK
//
//  Created by Антон Данилов on 27.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class NewsPhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    func updateImage(_ image: UIImage) {
        
        self.image.image = image
    }
    
}
