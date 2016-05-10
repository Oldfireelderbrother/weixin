//
//  PhotoPickerViewController.swift
//  weixin
//
//  Created by 博 郑 on 16/4/25.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit
protocol PhotoPickerDelegate{
    func getImageFromPicker(image:UIImage)
}
class PhotoPickerViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    var alert : UIAlertController?
    
    var picker : UIImagePickerController!
    
    var delegate : PhotoPickerDelegate!
    init(){
        super.init(nibName: nil, bundle: nil)
        //背景变成透明的
        self.modalPresentationStyle = .OverFullScreen
        
        self.view.backgroundColor = UIColor.clearColor()
        
        self.picker = UIImagePickerController()
        //自己来截图
        self.picker.allowsEditing = false
        
        self.picker.delegate = self
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        if(self.alert == nil){
            self.alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            
            self.alert?.addAction(UIAlertAction(title: "从相册选择", style: .Default, handler: { (action) -> Void in
                self.localPhoto()
            }))
            self.alert?.addAction(UIAlertAction(title: "打开相机", style: .Default, handler: { (action) -> Void in
                self.takePhone()
            }))
            self.alert?.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
            }))
            self.presentViewController(self.alert!, animated: true, completion: { () -> Void in
                
            })
        }
    }
    func localPhoto(){
        self.picker.sourceType = .PhotoLibrary
        self.presentViewController(self.picker, animated: true) { () -> Void in
            
        }
    }
    func takePhone(){
        if(UIImagePickerController.isSourceTypeAvailable(.Camera)){
            self.picker.sourceType = .Camera
            self.presentViewController(self.picker, animated: true, completion: { () -> Void in
                
                 
            })
        }
        else{
            let alertview = UIAlertController(title: "此机型无相机", message: nil, preferredStyle: .Alert)
            alertview.addAction(UIAlertAction(title: "关闭", style: .Cancel, handler: { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
                
            }))
            self.presentViewController(alertview, animated: true, completion: { () -> Void in
                
            })
        }
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.picker.dismissViewControllerAnimated(true) { () -> Void in
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                
            })
        }
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage]as!UIImage
 
        self.picker.dismissViewControllerAnimated(true) { () -> Void in
            self.delegate.getImageFromPicker(image)
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                
            })
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
