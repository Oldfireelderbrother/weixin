//
//  PersonInfoTableViewCell.swift
//  weixin
//
//  Created by 博 郑 on 16/4/26.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit

class PersonInfoTableViewCell: UITableViewCell {
    var imageV : UIImageView?
    var label : UILabel!
    var label_2 : UILabel?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView(){
        imageV = UIImageView(frame: CGRect(x: SCREEN_WIDTH-100, y: 10, width: 80, height: 80))
        
        
        label = UILabel(frame: CGRect(x: 20, y: 40, width: 80, height: 20))
        
        label.text = "头像"
        
            self.addSubview(imageV!)
        
        
        
        label_2 = UILabel(frame: CGRect(x: 100, y: 40, width: SCREEN_WIDTH-120, height: 20))
        
        label_2?.textAlignment = .Right
        
        
           self.addSubview(label_2!)
        
        
        
        
        self.addSubview(label)
    }

}
