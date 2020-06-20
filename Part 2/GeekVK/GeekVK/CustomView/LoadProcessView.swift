//
//  LoadProcessView.swift
//  GeekVK
//
//  Created by Антон Данилов on 20.06.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class LoadProcessView: UIView {
    
    let loadCircleView1 = UIView()
    let loadCircleView2 = UIView()
    let loadCircleView3 = UIView()
    
    let diametre = 10
    var x: Int?
    var y: Int?
        
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        self.addSubview(loadCircleView1)
        self.addSubview(loadCircleView2)
        self.addSubview(loadCircleView3)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        configureView()
    }
    
    fileprivate func configureView() {
        loadCircleView1.frame = CGRect(x: x! - 20, y: y!, width: diametre, height: diametre)
        loadCircleView2.frame = CGRect(x: x!, y: y!, width: diametre, height: diametre)
        loadCircleView3.frame = CGRect(x: x! + 20, y: y!, width: diametre, height: diametre)
                
        animateLoad()
    }
    
    private func animateLoad() {
        loadCircleView1.layer.cornerRadius = CGFloat(diametre / 2)
        loadCircleView1.backgroundColor = .white
        
        loadCircleView2.layer.cornerRadius = CGFloat(diametre / 2)
        loadCircleView2.backgroundColor = .white
        
        loadCircleView3.layer.cornerRadius = CGFloat(diametre / 2)
        loadCircleView3.backgroundColor = .white

        UIView.animate(withDuration: 1.5, delay: 0.5, options: [.repeat, .autoreverse], animations: {
            self.loadCircleView1.alpha = 0.1
        })
        UIView.animate(withDuration: 1.5, delay: 1, options: [.repeat, .autoreverse], animations: {
            self.loadCircleView2.alpha = 0.1
        })
        UIView.animate(withDuration: 1.5, delay: 1.5, options: [.repeat, .autoreverse], animations: {
            self.loadCircleView3.alpha = 0.1
        })
    }
}
