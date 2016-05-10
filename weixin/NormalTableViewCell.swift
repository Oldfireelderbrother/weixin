//
//  NormalTableViewCell.swift
//  weixin
//
//  Created by 博 郑 on 16/4/25.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit

class NormalTableViewCell: UITableViewCell {

    var imageView1 : UIImageView!
    
    var label : UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor=UIColor.whiteColor()
        
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView(){
        imageView1 = UIImageView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
        
        let image = UIImage(named: "1")
        
        imageView1.image = image
        
        label = UILabel(frame: CGRect(x: 55, y: 20, width: SCREEN_WIDTH/3, height:20))
        
        label.text = "zhap"
        
        self.addSubview(imageView1)
        
        self.addSubview(label)
        
    }
}
