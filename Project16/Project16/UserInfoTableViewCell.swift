//
//  UserInfoTableViewCell.swift
//  Project16
//
//  Created by 馬丹君 on 2019/7/2.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    
   
   
    @IBOutlet weak var InfoImageView: UIImageView!
    
    @IBOutlet weak var InfoNameLabel: UILabel!
    
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    @IBOutlet weak var noteLabel: UILabel!
    
    var userInfo:[String:String]? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
