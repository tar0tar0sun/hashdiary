//
//  dayViewController.swift
//  hashDiary
//
//  Created by 浅田真太郎 on 2016/08/16.
//  Copyright © 2016年 浅田真太郎. All rights reserved.
//

import UIKit


class dayViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate,UITextFieldDelegate
{
    //名前つけて
    @IBOutlet weak var celectedDateLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var diaryTitle: UITextField!
    @IBOutlet weak var myCellView: UITableView!
    
    
    //今日の日付を表示
    var selectedDate = NSDate()
    
    //日記のタイトル
    var titleList = [["title":"タイトル1","date":"2016-05-13"],["title":"タイトル2","date":"2016-05-14"],["title":"タイトル3","date":"2016-05-15"]]
   //日記の内容の名前付け
    var contentsHash = [["contents":"日記内容","date":"2016-05-13"]]
    
    // 削除の機能
    // ※スワイプで処理する場合、ここでは何もしないが関数は必要
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {

        //消す作業
        //ifで1つ以上だったら消せるっていう機能
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
                contentsHash.removeAtIndex(indexPath.row)
                
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
        
    
       override func viewDidLoad()
 {
        super.viewDidLoad()
        
        //キーボードにボタン追加[Done]
        // ボタンビュー作成
        var myKeyboard = UIView(frame: CGRectMake(0, 0, 320, 40))
        myKeyboard.backgroundColor = UIColor.darkGrayColor()
        
        // Doneボタン作成
        var myButton = UIButton(frame: CGRectMake(5, 5, 80, 30))
        myButton.backgroundColor = UIColor.lightGrayColor()
        myButton.setTitle("Done", forState: UIControlState.Normal)
        myButton.addTarget(self, action: "onMyButton", forControlEvents: UIControlEvents.TouchUpInside)
        
        // ボタンをビューに追加
        myKeyboard.addSubview(myButton)
        
        // ビューをフィールドに設定
        diaryTitle.inputAccessoryView = myKeyboard
        diaryTitle.delegate = self
    
        
        
        //ユーザーデフォルトから保存した配列を取り出す
        var myDefault = NSUserDefaults.standardUserDefaults()
        //ユーザーデフォルトを全削除する→一端削除するとコメントアウトする
//       var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
//      myDefault.removePersistentDomainForName(appDomain)

        //タイトル
        if (myDefault.objectForKey("diaryList") != nil)
        {
            //データ取り出し
            titleList = myDefault.objectForKey("diaryList") as! [Dictionary]
        }
        print(titleList)
        
        //内容
        if (myDefault.objectForKey("contentsHash") != nil)
        {
            //データ取り出し
            contentsHash = myDefault.objectForKey("contentsHash") as! [Dictionary]
        }
        print(contentsHash)

        
        
        
        // NavigationBarを隠す処理
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        //日を表示、代入祭り
        var df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        var datestr = df.stringFromDate(selectedDate)
        
        //デバックエリアに表示
        print("\(datestr)の日記です")
        
        celectedDateLabel.text = "\(datestr)"
        
        
        //配列の個数だけ繰り返し表示(配列から辞書データを取り出す):タイトル
        for dat in titleList
        {}
 }

    
    //次画面
    @IBAction func changeNextDate(sender: UIButton)
    {
        changeDateDisplay(-1)
    }
    
   
    //次画面
    @IBAction func changePreviousDate(sender: UIButton)
    {
         changeDateDisplay(+1)
    }
    
    //関数でまとめてシンプルに
    func changeDateDisplay(var dayChangeNumber:Int)
    {
        let cal = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        
        selectedDate = cal.dateByAddingUnit(.Day, value: dayChangeNumber, toDate: selectedDate, options: NSCalendarOptions())!
        
        var df = NSDateFormatter()
        
        df.dateFormat = "yyyy/MM/dd"
        
        var datestr = df.stringFromDate(selectedDate)
        
        celectedDateLabel.text = "\(datestr)"
        
    }
    
    
    
    //スワイプ効果
    @IBAction func swipe(sender: UISwipeGestureRecognizer)
    {
        navigationController?.popViewControllerAnimated(true)
        print("スワイプしました")
    }
 
    //cellの数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return contentsHash.count}
    //cellの中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {var cell = tableView.dequeueReusableCellWithIdentifier("hashcell") as! hashTableViewCell
            //cell.textLabel?.text = "文字列"
            //書いた内容が表示される代入文
            cell.contentText.text = contentsHash[indexPath.row]["contents"]
           
            return cell
    }
    
    
    //保存ボタン
    @IBAction func saveBtn(sender: UIButton)
    {
        var i = 0
        for dat in titleList
        {
            //stringは文字
            var savedDate = dat["date"] as! String!
            var savedTitle = dat["title"] as! String!
            
            
           
            //日を表示、代入祭り
            var df = NSDateFormatter()
            df.dateFormat = "yyyy/MM/dd"
            var datestr = df.stringFromDate(selectedDate)
            
            //titleの表示、データの数字と選んだ数字
            if (savedDate == datestr){titleList.removeAtIndex(i)}
            
            i++
            
            print("date[\(savedDate)] title[\(savedTitle)]")
        }

        
        
        //タイトルの追加
        titleList.append(["title":diaryTitle.text!,"date":celectedDateLabel.text!])
        
        
        //ユーザーデフォルトに保存する作業
        //ユーザーデフォルトを用意
        var myDefault = NSUserDefaults.standardUserDefaults()
        //データを書き込んで
        myDefault.setObject(titleList, forKey:"titleList")
        myDefault.setObject(
            contentsHash, forKey:"contentsHash")
        //即反映される
        myDefault.synchronize()
        
        print("保存されました")


    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //タイトルのDONEボタンが押された時
    func onMyButton ()
    {
        self.view.endEditing(true )
    }


}
