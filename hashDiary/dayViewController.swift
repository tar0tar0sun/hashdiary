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
    @IBOutlet weak var celectedDateLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    //今日の日付を表示
    var selectedDate = NSDate()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // NavigationBarを隠す処理
        self.navigationController?.setNavigationBarHidden(true, animated: true)
       
        var df = NSDateFormatter()
        
        df.dateFormat = "yyyy/MM/dd"
        
        var datestr = df.stringFromDate(selectedDate)
        
        print("\(datestr)の日記です")
        
        celectedDateLabel.text = "\(datestr)"
        
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
        UITableViewCell {var cell = UITableViewCell(style: .Default, reuseIdentifier: "hashcell")
            //cell.textLabel?.text = "文字列"
            return cell
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
