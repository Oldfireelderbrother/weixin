//
//  PersonInfoTableViewController.swift
//  weixin
//
//  Created by 博 郑 on 16/4/26.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit

class PersonInfoTableViewController: UITableViewController {

    private struct CellIdentifier {
        static let HeadCellIdentifier = "HeadCell"

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.scrollEnabled = false
        self.title = "个人信息"
        //设置导航条与cell的距离
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        tableView.registerClass(PersonInfoTableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier.HeadCellIdentifier)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100
        }
        else{
            return 70
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier.HeadCellIdentifier, forIndexPath: indexPath)as!PersonInfoTableViewCell
        switch(indexPath.row){
        case 0:
            cell.label.text = "头像"
            let image = UIImage(named: "a3t")
            cell.imageV?.image = image
        case 1:
            cell.label.text = "昵称"
            cell.label_2?.text = "啊8"
        case 2:
            cell.label.text = "性别"
            cell.label_2?.text = "男"
            
        case 3:
            cell.label.text = "个性签名"
            cell.label_2?.text = "dsadsad"
            
            
        default:break
        }
        return cell
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
