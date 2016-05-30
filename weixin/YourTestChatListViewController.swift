//
//  YourTestChatListViewController.swift
//  weixin
//
//  Created by 博 郑 on 16/5/12.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit

class YourTestChatListViewController: RCConversationListViewController ,selectIndexPathDelegate{
    var btn : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn = UIButton(type: .ContactAdd)
        btn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        btn.setTitle("", forState: .Normal)
        btn.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        var bTn = UIBarButtonItem.init(customView: btn)
        self.navigationController?.navigationBar.tintColor=UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor=UIColor.blackColor()
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationItem.title="微信"
        self.navigationItem.rightBarButtonItem = bTn
        navigationController?.navigationBar.titleTextAttributes = attributes
        
        self.setDisplayConversationTypes([RCConversationType.ConversationType_PRIVATE.rawValue,
            RCConversationType.ConversationType_DISCUSSION.rawValue,
            RCConversationType.ConversationType_CHATROOM.rawValue,
            RCConversationType.ConversationType_GROUP.rawValue,
            RCConversationType.ConversationType_APPSERVICE.rawValue,
            RCConversationType.ConversationType_SYSTEM.rawValue])
        self.setCollectionConversationType([RCConversationType.ConversationType_DISCUSSION.rawValue,
            RCConversationType.ConversationType_GROUP.rawValue])

    }
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        let chat = RCConversationViewController(conversationType: model.conversationType, targetId: model.targetId)
        chat.title = "\(model.targetId)"
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(chat, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    func btnClick(btn : UIButton){
        var point = CGPoint(x: btn.center.x, y: btn.center.y+64)
        var view1 = XTPopView.init(origin: point, width: 130, height: 40*4, type: XTDirectionType.TypeOfRightUp, color: UIColor(colorLiteralRed: 0.2737, green: 0.2737, blue: 0.2737, alpha: 1.0))
        view1.dataArray = ["发起群聊","添加朋友","扫一扫","收付款"]
        view1.images = ["发起群聊","添加朋友","扫一扫","付款"]
        view1.fontSize = 13
        view1.row_height = 40
        view1.titleTextColor = UIColor.whiteColor()
        view1.delegate = self
        view1.popView()
        
    }
    func selectIndexPathRow(index: Int) {
        switch (index) {
        case 0:
            
            print("1")
            
            break
        case 1:
            let afViewC = AddFriendViewController()
                self.navigationController?.pushViewController(afViewC, animated: true)
            
            break
        case 2:
            
                print("3")
            
            break
        case 3:
            
                print("4")
            
            break
        default:
            break
        }
    }
}
