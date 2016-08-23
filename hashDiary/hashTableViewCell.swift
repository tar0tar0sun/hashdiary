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
    }
    
    
    
         override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
