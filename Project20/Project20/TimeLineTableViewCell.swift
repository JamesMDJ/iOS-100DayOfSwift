//
//  timeLineTableViewCell.swift
//  Project20
//
//  Created by 馬丹君 on 2019/7/3.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLineImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        
//        self.timeLineImageView?.frame = CGRect(x: 10,y: 100,width: 120,height: 140)
//        self.timeLineImageView?.contentMode = .scaleAspectFit
    }

}
