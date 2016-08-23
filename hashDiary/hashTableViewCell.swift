//
//  hashTableViewCell.swift
//  hashDiary
//
//  Created by 浅田真太郎 on 2016/08/18.
//  Copyright © 2016年 浅田真太郎. All rights reserved.
//

import UIKit

class hashTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var contentHash: UILabel!
    @IBOutlet weak var contentText: UITextField!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    
    
    
        //ユーザーデフォルトから保存した配列を取り出す
        var myDefault = NSUserDefaults.standardUserDefaults()
        //ユーザーデフォルトを全削除する→一端削除するとコメントアウトする
        // var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
        //myDefault.removePersistentDomainForName(appDomain)
        
        if (myDefault.objectForKey("contentText") != nil)
        {
            //データ取り出し
            contentText = myDefault.objectForKey("contentText") as! [Dictionary]
        }
        print(contentText)


    
        @IBAction func saveBtn(sender: UIButton)
        {
            var i = 0
            for dat in contentText
            {
                //stringは文字
                var savedDate = dat["date"] as! String!
                var savedTitle = dat["title"] as! String!
                
                //日を表示、代入祭り
                var df = NSDateFormatter()
                df.dateFormat = "yyyy/MM/dd"
                var datestr = df.stringFromDate(selectedDate)
                
                //titleの表示、データの数字と選んだ数字
                if (savedDate == datestr){contentText.removeAtIndex(i)}
                
                i++
                
                print("date[\(savedDate)] title[\(savedTitle)]")
                
            }

    
        //タイトルの追加
        contentText.append(["title":contentText.text!,"date":celectedDateLabel.text!])
        
        //ユーザーデフォルトに保存する作業
        //ユーザーデフォルトを用意
        var myDefault = NSUserDefaults.standardUserDefaults()
        //データを書き込んで
        myDefault.setObject(contentText, forKey:"contentText")
        //即反映される
        myDefault.synchronize()
        
        print("保存されました")

    
    }
    

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
