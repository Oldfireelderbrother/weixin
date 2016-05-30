//
//  FaXianTableViewController.swift
//  weixin
//
//  Created by 博 郑 on 16/4/18.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit

class FaXianTableViewController: UITableViewController ,selectIndexPathDelegate{
    private struct CellIdentifier {
        static let FaXianCellIdentifier = "FaXianCell"
        
    }
    var btn :UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = true
        btn = UIButton(type: .ContactAdd)
        btn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        btn.setTitle("", forState: .Normal)
        btn.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        var bTn = UIBarButtonItem.init(customView: btn)
        self.navigationController?.navigationBar.tintColor=UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor=UIColor.blackColor()
        self.view.backgroundColor=UIColor.groupTableViewBackgroundColor()
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationItem.title="微信"
        self.navigationItem.rightBarButtonItem = bTn
        navigationController?.navigationBar.titleTextAttributes = attributes
        //self.tableView.scrollEnabled = false
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        tableView.registerClass(FaXianNormalTableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier.FaXianCellIdentifier)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 4{
           return 0
        }
        
        else{
           return 20 
        }
        
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return SCREEN_HEIGHT/12
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return 1
        }
        else{
            return 2
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier.FaXianCellIdentifier, forIndexPath: indexPath)as!FaXianNormalTableViewCell
        
        switch(indexPath.section,indexPath.row){
        case (0,0):
            cell.label.text = "朋友圈"
            cell.imageView?.image = UIImage(named: "ff_IconShowAlbum")
        case (1,0):
            cell.label.text = "扫一扫"
            cell.imageView?.image = UIImage(named: "ff_IconQRCode")
        case (1,1):
            cell.label.text = "摇一摇"
            cell.imageView?.image = UIImage(named: "ff_IconShake")
        case (2,0):
            cell.label.text = "附近的人"
            cell.imageView?.image = UIImage(named: "ff_IconLocationService")
        case (2,1):
            cell.label.text = "漂流瓶"
            cell.imageView?.image = UIImage(named: "ff_IconBottle")
        default :
            break
        }
        

       

        return cell
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
