//
//  RegisterViewController.swift
//  weixin
//
//  Created by 博 郑 on 16/4/25.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit
import MBProgressHUD
class RegisterViewController: UIViewController,PhotoPickerDelegate,UITextFieldDelegate {
    var userName : UILabel!
    
    var passWord : UILabel!
    
    var phoneNumber : UILabel!
    
    var UNtextFiled : UITextField!
    
    var PWtextFiled : UITextField!
    
    var PNtextFiled : UITextField!
    
    var button : UIButton!
    
    var headImageButton :UIButton!
    
    var label : String!
    
    var hud : MBProgressHUD!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView(){
        
        userName = UILabel(frame: CGRect(x: 20, y: 100, width: 50, height: 20))
        
        userName.text = "昵称"
        
        UNtextFiled = UITextField(frame: CGRect(x: 80 , y: 100, width: SCREEN_WIDTH-180, height: 20))
        
        UNtextFiled.placeholder = "例如：陈晨"
        
        
        headImageButton = UIButton(frame: CGRect(x: SCREEN_WIDTH-100, y: 65, width: 80, height: 80))
        
        let image = UIImage(named: "a3t")
        
        headImageButton.setBackgroundImage(image, forState: .Normal)
        
        headImageButton.addTarget(self, action: "choiceCover", forControlEvents: .TouchUpInside)
        
        phoneNumber = UILabel(frame: CGRect(x: 20, y: 130, width: 50, height: 20))
        
        phoneNumber.text = "+86"
        
        PNtextFiled = UITextField(frame: CGRect(x: 80, y: 130, width: SCREEN_WIDTH-50, height: 20))
        
        PNtextFiled.placeholder = "你的手机号码"
        
        passWord = UILabel(frame: CGRect(x: 20, y: 170, width: 50, height: 20))
        
        passWord.text = "密码"
        
        PWtextFiled = UITextField(frame: CGRect(x: 80, y: 170, width: SCREEN_WIDTH-50, height: 20))
        
        PWtextFiled.placeholder = "填写密码"
        
        PWtextFiled.secureTextEntry = true
        
        button = UIButton(frame: CGRect(x: 20, y: 210, width: SCREEN_WIDTH-40, height: 40))
        
        button.setTitle("注册", forState: UIControlState.Normal)
        
        button.backgroundColor = UIColor.greenColor()
        
        button.addTarget(self, action: "register", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(button)
        
        self.view.addSubview(passWord)
        
        self.view.addSubview(PWtextFiled)
        
        self.view.addSubview(phoneNumber)
        
        self.view.addSubview(PNtextFiled)
        
        self.view.addSubview(userName)
        
        self.view.addSubview(UNtextFiled)
        
        self.view.addSubview(headImageButton)
        
        
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        PWtextFiled.resignFirstResponder()
        PNtextFiled.resignFirstResponder()
        UNtextFiled.resignFirstResponder()
    }
    func register(){
//        //建立用户的AVObject
//        let user = AVObject(className: "ZBuser")
//        //把输入的文本框的值，设置到对象中
//        user.addObject(self.UNtextFiled.text, forKey: "username")
//        user.addObject(self.PNtextFiled.text, forKey: "phonenumber")
//        user.addObject(self.PWtextFiled.text, forKey: "password")
//        
//        //查询用户是否已经注册
//        let query = AVQuery(className: "ZBuser")
//        query.whereKey("phonenumber", equalTo: self.PNtextFiled.text)
//        
//        //执行查询
//        query.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
//            if object != nil {
//             print("1")
//            }else{
//               //用户注册
//                user.saveInBackgroundWithBlock({ (succeed, e) -> Void in
//                    if succeed {
//                        print("11")
//                        
//                        let dataDict = NSDictionary(object: self.PNtextFiled.text!, forKey: "phonenumber")
//                        
//                        NSNotificationCenter.defaultCenter().postNotificationName("RegisterViewController", object: nil, userInfo: dataDict as [NSObject : AnyObject])
//                        
//                        self.navigationController?.popViewControllerAnimated(true)
//                        
//                    }else{
//                        print("22")
//                        
//                    }
//                })
//            }
//        }
    //建立avuser拥护
        let user = AVUser()
        user.username = PNtextFiled.text!
        user.password = PWtextFiled.text!
        user.addObject(UNtextFiled.text!, forKey: "name_1")
        user.saveInBackground()
        user.email=nil
        user.signUpInBackgroundWithBlock { (succeed, Error) -> Void in
            if(succeed){
                self.hud = MBProgressHUD.init(view: self.view)
                self.view.addSubview(self.hud)
                self.hud.mode = MBProgressHUDMode.Text
                self.hud.labelText = "注册成功"
                self.hud.showAnimated(true, whileExecutingBlock: { () -> Void in
                    sleep(1)
                    }, completionBlock: { () -> Void in
                        let dataDict = NSDictionary(object: self.PNtextFiled.text!, forKey: "phonenumber")
                        NSNotificationCenter.defaultCenter().postNotificationName("RegisterViewController", object: nil, userInfo: dataDict as [NSObject : AnyObject])
                        self.hud.removeFromSuperview()
                        self.navigationController?.popViewControllerAnimated(true)
                })
                
                
            }else{
                //消息提示
                self.hud = MBProgressHUD.init(view: self.view)
                self.view.addSubview(self.hud)
                self.hud.mode = MBProgressHUDMode.Text
                self.hud.labelText = "注册失败"
                self.hud.showAnimated(true, whileExecutingBlock: { () -> Void in
                    sleep(1)
                    }, completionBlock: { () -> Void in
                        
                        self.hud.removeFromSuperview()  })
            }
        }
    }
    
    func choiceCover(){
        let vc = PhotoPickerViewController()
        
        vc.delegate = self
        
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
    }

    func getImageFromPicker(image: UIImage) {
        self.headImageButton.setBackgroundImage(image, forState: UIControlState.Normal)
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
