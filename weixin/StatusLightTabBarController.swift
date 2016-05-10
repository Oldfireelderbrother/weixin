//
//  StatusLightTabBarController.swift
//  weixin
//
//  Created by 博 郑 on 16/4/10.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit

class StatusLightTabBarController: UITabBarController {

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func childViewControllerForStatusBarStyle() -> UIViewController? {
        return nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
