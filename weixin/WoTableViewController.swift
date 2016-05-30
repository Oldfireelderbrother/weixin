//
//  WoTableViewController.swift
//  weixin
//
//  Created by 博 郑 on 16/4/18.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit

class WoTableViewController: UITableViewController,selectIndexPathDelegate {

    private struct CellIdentifier {
        static let HeadCellIdentifier = "HeadCell"
        
        static let NormalCellIdentifier = "NormalCell"
    }
    var btn :UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn = UIButton(type: .ContactAdd)
        btn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        btn.setTitle("", forState: .Normal)
        btn.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        var bTn = UIBarButtonItem.init(customView: btn)

        self.automaticallyAdjustsScrollViewInsets = true
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.titleTextAttributes = attributes
       
        self.navigationItem.title = "微信"
        self.navigationItem.rightBarButtonItem = bTn
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        //self.tableView.scrollEnabled = false
        
        tableView.registerClass(WoHeadTableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier.HeadCellIdentifier)
        
        tableView.registerClass(NormalTableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier.NormalCellIdentifier)
        //设置导航条与cell的距离
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        
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
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 1 || section == 2
        {
            return 2
        }
        else{
            return 1
        }
        
    }

    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier.HeadCellIdentifier, forIndexPath: indexPath)as!WoHeadTableViewCell
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier.NormalCellIdentifier, forIndexPath: indexPath)as!NormalTableViewCell
            switch (indexPath.section,indexPath.row){

            case (1,0):
                let image = UIImage(named: "MoreMyAlbum")
                
                cell.imageView1.image = image
                
                cell.label.text = "相册"
                
            case (1,1):
                let image = UIImage(named: "MoreMyFavorites")
                
                cell.imageView1.image = image
                
                cell.label.text = "收藏"
                
            case (2,0):
                let image = UIImage(named: "MoreMyBankCard")
                
                cell.imageView1.image = image
                
                cell.label.text = "钱包"
                
            case (2,1):
                let image = UIImage(named: "MyCardPackageIcon")
                
                cell.imageView1.image = image
                
                cell.label.text = "卡券"
                
            case (3,0):
                let image = UIImage(named: "MoreExpressionShops")
                
                cell.imageView1.image = image
                
                cell.label.text = "表情"
                
            case (4,0):
                let image = UIImage(named: "MoreSetting")
                
                cell.imageView1.image = image
                
                cell.label.text = "设置"
                
                
                
            default: break
               
            }
            return cell
        }
        
        

        // Configure the cell...

    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch(indexPath.section,indexPath.row){
        case(0,0):
            let pitView = PersonInfoTableViewController()
            self.navigationController?.pushViewController(pitView, animated: true)
        case(4,0):
            let stTableView = SettingTableViewController()
            self.navigationController?.pushViewController(stTableView, animated: true)
            
        default:break
        }
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row==0
        {
           return SCREEN_HEIGHT/7
        }
        else
        {
            return  SCREEN_HEIGHT/12
        }
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
