//
//  UserFriendDataModel.swift
//  weixin
//
//  Created by 博 郑 on 16/5/14.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import Foundation

class UserFriendDataModel {
    var FriendDatas = UserFriendData()
    func getFriend(afterDoing:(UserFriendData)->()){
        print("111111")
        
        let query = AVQuery(className: "UserFriend")
        query.whereKey("UserID", equalTo: "zb")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil{
                print("222222")
                if objects.count != 0 {
                    print("333333")
                    let object = objects[0]
                    self.FriendDatas.friendArry = object["friendArray"] as? NSArray
                    
                    
                    
                }
            }
            afterDoing(self.FriendDatas)
        }

    }
//    func getFriend()->Int{
//        print("111111")
//        
//        let query = AVQuery(className: "UserFriend")
//        query.whereKey("UserID", equalTo: "zb")
//        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
//            if error == nil{
//                print("222222")
//                if objects.count != 0 {
//                    print("333333")
//                    let object = objects[0]
//                    self.FriendDatas.friendArry = object["friendArray"] as? NSArray
//                   
//                    print(self.FriendDatas.friendArry.count)
//                    
//                }
//            }
//        }
//        
//        return self.FriendDatas.friendArry.count
//    }
}