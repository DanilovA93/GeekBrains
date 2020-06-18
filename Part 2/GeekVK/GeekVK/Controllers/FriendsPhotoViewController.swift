//
//  FriendsPhotoViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 18.06.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class FriendsPhotoViewController: UIViewController {

    @IBOutlet var friendsPhotoScrollView: UIScrollView!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsPhotoScrollView.frame = view.frame
        
        for i in 0..<(user?.avatar!.count)! {
            let imageView = UIImageView()
            imageView.image = user!.avatar![i]
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.friendsPhotoScrollView.frame.width, height: self.friendsPhotoScrollView.frame.height)
            
            friendsPhotoScrollView.contentSize.width = friendsPhotoScrollView.frame.width * CGFloat(i + 1)
            friendsPhotoScrollView.addSubview(imageView)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
