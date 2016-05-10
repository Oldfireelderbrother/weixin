//
//  WoHeadTableViewCell.swift
//  weixin
//
//  Created by 博 郑 on 16/4/25.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit

class WoHeadTableViewCell: UITableViewCell {
    
    
    var  nameLabel : UILabel!
    
    var  loginName : UILabel!
    
    var  headImage : UIImage!
    
    let  name = "zbzbzb552200"
    
    var  image1 : UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.whiteColor()
        
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView(){
        image1 = UIImageView(frame: CGRect(x: 10, y: 5, width: SCREEN_WIDTH/5, height: SCREEN_HEIGHT/7-20))
        
        self.addSubview(image1)
        
        headImage = UIImage(named: "1")
        
        image1.image = headImage
        
        nameLabel = UILabel(frame: CGRect(x: SCREEN_WIDTH/5+20, y: 30, width: SCREEN_WIDTH/3, height: 20))
        
        nameLabel.text = "啊8"
        
        loginName = UILabel(frame: CGRect(x: SCREEN_WIDTH/5+20, y: 50, width: SCREEN_WIDTH/2, height: 20))
        
        loginName.text = "微信号：\(name)"
        
        self.addSubview(nameLabel)
        
        self.addSubview(loginName)
    }
    
    
}

