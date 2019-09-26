//
//  ChartsTableViewCell.swift
//  Project30
//
//  Created by 馬丹君 on 2019/7/8.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ChartsTableViewCell: UITableViewCell {


    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
