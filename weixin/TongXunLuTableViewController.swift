//
//  TongXunLuTableViewController.swift
//  weixin
//
//  Created by 博 郑 on 16/4/10.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit
import MJRefresh

class TongXunLuTableViewController: UITableViewController ,selectIndexPathDelegate{
    var  userFriendDataModel = UserFriendDataModel()
    var  userFriendData = UserFriendData()
    
    var  count : Int! = 0
    var  footerRefresh : MJRefreshAutoNormalFooter!
    var btn : UIButton!
    private struct CellIdentifier {
        static let ChatCellIdentifier = "ChatCell"
    
    }
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
        
        tableView.registerClass(ChatTableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier.ChatCellIdentifier)
        let headerRefresh = MJRefreshGifHeader(refreshingTarget: self, refreshingAction: "loadData:")
        footerRefresh = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: "loadDataup:")
        tableView.mj_header = headerRefresh
        tableView.mj_footer = footerRefresh
        footerRefresh.hidden = true
        headerRefresh.beginRefreshing()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadData(refresh: MJRefreshGifHeader){
        
        footerRefresh.hidden = true
        userFriendDataModel.getFriend { (UserFriendData) -> () in
            self.userFriendData = UserFriendData
            self.count =  UserFriendData.friendArry.count
            self.tableView.reloadData()
            refresh.endRefreshing()
            self.footerRefresh.hidden = false
            if self.userFriendData.friendArry.count == 0{
                self.footerRefresh.endRefreshingWithNoMoreData()
            }
                       print(self.count)
        }
    }
    
    func loadDataup(refresh: MJRefreshAutoNormalFooter){
        userFriendDataModel.getFriend { (UserFriendData) -> () in
            if self.userFriendData.friendArry.count == UserFriendData.friendArry.count {
                refresh.endRefreshingWithNoMoreData()
            }else{
                self.userFriendData = UserFriendData
                self.tableView.reloadData()
                refresh.endRefreshing()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(self.count)
        
        // #warning Incomplete implementation, return the number of rows
        return self.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier.ChatCellIdentifier, forIndexPath: indexPath)as!ChatTableViewCell
        cell.label.text = userFriendData.friendArry.objectAtIndex(indexPath.row) as! String

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let chat = RCConversationViewController()
        chat.conversationType = RCConversationType.ConversationType_PRIVATE
        //chat.targetId = "啊10"
        chat.targetId = userFriendData.friendArry.objectAtIndex(indexPath.row) as! String
        chat.title = "啊8"
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
