//
//  hashTableViewCell.swift
//  hashDiary
//
//  Created by 浅田真太郎 on 2016/08/18.
//  Copyright © 2016年 浅田真太郎. All rights reserved.
//

import UIKit

class hashTableViewCell: UITableViewCell,UITextFieldDelegate
{
    
    @IBOutlet weak var contentHash: UILabel!
    @IBOutlet weak var contentText: UITextField!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        
        //キーボードにボタン追加[hash]
        // ボタンビュー作成
        var myKeyboard = UIView(frame: CGRectMake(0, 0, 320, 40))
        myKeyboard.backgroundColor = UIColor.darkGrayColor()
        
        // Doneボタン作成
        var myButton = UIButton(frame: CGRectMake(5, 5, 80, 30))
        myButton.backgroundColor = UIColor.lightGrayColor()
        myButton.setTitle("#", forState: UIControlState.Normal)
        myButton.addTarget(self, action: "onMyButton", forControlEvents: UIControlEvents.TouchUpInside)
        
        // ボタンをビューに追加
        myKeyboard.addSubview(myButton)
        
        // ビューをフィールドに設定
        contentText.inputAccessoryView = myKeyboard
        contentText.delegate = self
        
        //キーボードにボタン追加[done]
        // ボタンビュー作成
//        var myKeyboard = UIView(frame: CGRectMake(0, 0, 320, 40))
//        myKeyboard.backgroundColor = UIColor.darkGrayColor()
        
        // Doneボタン作成
        var myButton2 = UIButton(frame: CGRectMake(105, 5, 80, 30))
        myButton2.backgroundColor = UIColor.lightGrayColor()
        myButton2.setTitle("Done", forState: UIControlState.Normal)
        myButton2.addTarget(self, action: "onMyButton2", forControlEvents: UIControlEvents.TouchUpInside)
        
        // ボタンをビューに追加
        myKeyboard.addSubview(myButton2)
        
        // ビューをフィールドに設定
        contentText.inputAccessoryView = myKeyboard
        contentText.delegate = self
        
        
    }
    
    
    
         override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //ハッシュボタン
   func onMyButton ()
    {
       // self.view.endEditing(true )
       //contentText.resignFirstResponder()
       //追加ボタン機能
    }
    
    //ダンボタン
    func onMyButton2 ()
    {
        // self.view.endEditing(true )
        contentText.resignFirstResponder()
    }



}
