//
//  ChatTableViewCell.swift
//  weixin
//
//  Created by 博 郑 on 16/5/12.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    var uiimage : UIImageView!
    var label : UILabel!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.whiteColor()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView(){
        uiimage = UIImageView(frame: CGRect(x: 20, y: 10, width: 50, height: 50))
        let image = UIImage(named: "Contact_Male")
        uiimage.image = image
        label = UILabel(frame: CGRect(x: 90, y: 30, width: SCREEN_WIDTH-90, height: 15))
        label.text = "啊8"
        self.addSubview(uiimage)
        self.addSubview(label)
    }

}
