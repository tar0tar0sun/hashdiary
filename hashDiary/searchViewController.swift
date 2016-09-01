//
//  searchViewController.swift
//  hashDiary
//
//  Created by 浅田真太郎 on 2016/08/31.
//  Copyright © 2016年 浅田真太郎. All rights reserved.
//

import UIKit

class searchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var answerTableView: UITableView!
    
    
   //日記の内容
    var contentsHash = [["contents":"日記内容","date":"2016-05-13"]]
    
    override func viewDidLoad()
    {
      super.viewDidLoad()
       
        //ユーザーデフォルトから保存した配列を取り出す
        //辞書データからデータを取り出し表示
        //①全部取り出し→②フィルターがけ→③表示
        //作業①
        var myDefault = NSUserDefaults.standardUserDefaults()
        //内容
        if (myDefault.objectForKey("contentsHash") != nil)
        {
            //データ取り出し
            contentsHash = myDefault.objectForKey("contentsHash") as! [Dictionary]
        }
        print(contentsHash)

    }
    
    //ボタン押したら終了
    @IBAction func doneBtn(sender: UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //①の作業
    //行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return contentsHash.count }
    //表示するセルの中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "answerTableViewCell")
        cell.textLabel?.text = "\(contentsHash[indexPath.row]["contents"]! as String)"
        return cell
    }
    //選択された時に行う作業
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        print("\(indexPath.row)行目を選択")
    }
    //ステータスバーを表示する
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
}