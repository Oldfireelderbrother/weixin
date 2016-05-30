//
//  AddFriendViewController.swift
//  weixin
//
//  Created by 博 郑 on 16/5/30.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit
import MBProgressHUD
class AddFriendViewController: UIViewController,UISearchBarDelegate {
    var searchbar : UISearchBar?
    var hud : MBProgressHUD!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.tintColor=UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor=UIColor.blackColor()
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationItem.title="搜索"
        //设置navigationbar不遮盖
        self.edgesForExtendedLayout = UIRectEdge.None
        setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupView(){
        searchbar = UISearchBar(frame: CGRect(x: 0, y: 10, width: SCREEN_WIDTH, height: 20))
        
        searchbar?.placeholder = "请输入搜索内容"
        searchbar?.delegate = self
        self.view.addSubview(searchbar!)
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        searchbar?.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let ssc = ShowSearchContentTableViewController()
        let query = AVQuery(className: "_User")
        query.whereKey("username", equalTo: self.searchbar?.text)
        query.findObjectsInBackgroundWithBlock { (Object, error) -> Void in
            if error == nil{
                print("meiyou cuowu ")
            
            if Object.count != 0 {
                
                self.hud = MBProgressHUD.init(view: self.view)
                self.view.addSubview(self.hud)
                self.hud.mode = MBProgressHUDMode.Text
                self.hud.labelText = "搜索中"
                self.hud.showAnimated(true, whileExecutingBlock: { () -> Void in
                    sleep(1)
                    }, completionBlock: { () -> Void in
                        
                        self.hud.removeFromSuperview()
                        self.navigationController?.pushViewController(ssc, animated: true)
                })

                
            }else{
                
                self.hud = MBProgressHUD.init(view: self.view)
                self.view.addSubview(self.hud)
                self.hud.mode = MBProgressHUDMode.Text
                self.hud.labelText = "该用户不存在"
                self.hud.showAnimated(true, whileExecutingBlock: { () -> Void in
                    sleep(1)
                    }, completionBlock: { () -> Void in
                        
                        self.hud.removeFromSuperview()
                        
                })
                }
            }
            else{
                print(error)
            }
        }
        
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
