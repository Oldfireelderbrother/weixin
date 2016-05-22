//
//  TongXunLuTableViewController.swift
//  weixin
//
//  Created by 博 郑 on 16/4/10.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit
import MJRefresh

class TongXunLuTableViewController: UITableViewController {
    var  userFriendDataModel = UserFriendDataModel()
    var  userFriendData = UserFriendData()
    
    var  count : Int! = 0
    var  footerRefresh : MJRefreshAutoNormalFooter!
    private struct CellIdentifier {
        static let ChatCellIdentifier = "ChatCell"
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.tintColor=UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor=UIColor.blackColor()
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationItem.title="微信"
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
//        for(var i=0; i<indexPath.row ;i++)
//        {
          cell.label.text = ""
//        }
        // Configure the cell...

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
