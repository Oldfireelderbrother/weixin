//
//  YourTestChatListViewController.swift
//  weixin
//
//  Created by 博 郑 on 16/5/12.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit

class YourTestChatListViewController: RCConversationListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
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
}
