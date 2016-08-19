//
//  dayViewController.swift
//  hashDiary
//
//  Created by 浅田真太郎 on 2016/08/16.
//  Copyright © 2016年 浅田真太郎. All rights reserved.
//

import UIKit


class dayViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate
{
    //名前つけて
    @IBOutlet weak var celectedDateLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var diaryTitle: UITextField!
    
    //今日の日付を表示
    var selectedDate = NSDate()
    
    //日記のタイトル
    var diaryList = [["title1":"タイトル1","date":"2016-05-13"],["title1":"タイトル2","date":"2016-05-14"],["title1":"タイトル3","date":"2016-05-15"]]
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        //ユーザーデフォルトから保存した配列を取り出す
        var myDefault = NSUserDefaults.standardUserDefaults()
        //ユーザーデフォルトを全削除する→一端削除するとコメントアウトする
       // var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
        //myDefault.removePersistentDomainForName(appDomain)

        if (myDefault.objectForKey("diaryList") != nil)
        {
            //データ取り出し
            diaryList = myDefault.objectForKey("diaryList") as! [Dictionary]
        }
        print(diaryList)
        
        
        // NavigationBarを隠す処理
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        //日を表示、代入祭り
        var df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        var datestr = df.stringFromDate(selectedDate)
        
        //デバックエリアに表示
        print("\(datestr)の日記です")
        
        celectedDateLabel.text = "\(datestr)"
        
        
        //配列の個数だけ繰り返し表示(配列から辞書データを取り出す)
        for dat in diaryList
        {
            //stringは文字
            var savedDate = dat["date"] as! String!
            var savedTitle = dat["title"] as! String!
            
            print("date[\(savedDate)] title[\(savedTitle)]")
            
            //titleの表示、データの数字と選んだ数字
            if (savedDate == datestr){diaryTitle.text = savedTitle}
        }
        
        
        

        
      
        
    }
    
    @IBAction func changeNextDate(sender: UIButton)
    {
        let cal = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        
        selectedDate = cal.dateByAddingUnit(.Day, value: +1, toDate: selectedDate, options: NSCalendarOptions())!
        
        var df = NSDateFormatter()
        
        df.dateFormat = "yyyy/MM/dd"
        
        var datestr = df.stringFromDate(selectedDate)
        
        celectedDateLabel.text = "\(datestr)"
        
    }
   
    @IBAction func changePreviousDate(sender: UIButton)
    {
        let cal = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        
        selectedDate = cal.dateByAddingUnit(.Day, value: -1, toDate: selectedDate, options: NSCalendarOptions())!
   
        var df = NSDateFormatter()
        
        df.dateFormat = "yyyy/MM/dd"
        
        var datestr = df.stringFromDate(selectedDate)
        
        celectedDateLabel.text = "\(datestr)"
    
    }
  
    @IBAction func swipe(sender: UISwipeGestureRecognizer)
    {
        navigationController?.popViewControllerAnimated(true)
        print("スワイプしました")
    }
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {var cell = tableView.dequeueReusableCellWithIdentifier("hashcell") as! hashTableViewCell
            //cell.textLabel?.text = "文字列"
            return cell
    }
    
    @IBAction func saveBtn(sender: UIButton)
    {
        var i = 0
        for dat in diaryList
        {
            //stringは文字
            var savedDate = dat["date"] as! String!
            var savedTitle = dat["title"] as! String!
           
            //日を表示、代入祭り
            var df = NSDateFormatter()
            df.dateFormat = "yyyy/MM/dd"
            var datestr = df.stringFromDate(selectedDate)
            
            //titleの表示、データの数字と選んだ数字
            if (savedDate == datestr){diaryList.removeAtIndex(i)}
            
            i++
            
            print("date[\(savedDate)] title[\(savedTitle)]")
            
            
            

        }

        
        
        //タイトルの追加
        diaryList.append(["title":diaryTitle.text!,"date":celectedDateLabel.text!])
        
        //ユーザーデフォルトに保存する作業
        //ユーザーデフォルトを用意
        var myDefault = NSUserDefaults.standardUserDefaults()
        //データを書き込んで
        myDefault.setObject(diaryList, forKey:"diaryList")
        //即反映される
        myDefault.synchronize()
        
        print("保存されました")

        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
