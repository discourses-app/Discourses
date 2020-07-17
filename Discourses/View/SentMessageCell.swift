//
//  SentMessageCell.swift
//  Discourses
//
//  Created by Abhishek Marda on 7/17/20.
//  Copyright © 2020 DiscoursesTeam. All rights reserved.
//

import UIKit

class SentMessageCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!

    @IBOutlet weak var messageBGView: UIView!
    @IBOutlet weak var leftBuffer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        leftBuffer.alpha = 0
        messageBGView.layer.cornerRadius = 20
        contentLabel.font = UIFont(name: "Cabin-Regular", size: 17)
        // Configure the view for the selected state
    }
    
}
