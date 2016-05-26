//
//  PersonInfoDataModel.swift
//  weixin
//
//  Created by 博 郑 on 16/5/22.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import Foundation
class PersonInfoDataModel {
    var personInfoData = PersonInfoData()
    func getPersonInfo(afterDoing:(PersonInfoData)->()){
        print("111111")
        
        let query = AVQuery(className: "_User")
        query.whereKey("username", equalTo: "2")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil{
                print("222222")
                if objects.count != 0 {
                    print("333333")
                    let object = objects[0]
                    self.personInfoData.name = object["username"]as! String
                    self.personInfoData.NiCheng = object["name_1"]as! String
                    //self.personInfoData.image = object["headImage"]as!
                    
                    
                }
            }
            afterDoing(self.personInfoData)
        }
        
}
}