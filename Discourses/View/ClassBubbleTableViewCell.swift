//
//  ClassBubbleTableViewCell.swift
//  Discourses
//
//  Created by Abhishek Marda on 7/15/20.
//  Copyright © 2020 DiscoursesTeam. All rights reserved.
//

import UIKit

class ClassBubbleTableViewCell: UITableViewCell {
    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var professorNameLabel: UILabel!
    
    @IBOutlet weak var bubbleTopConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        classNameLabel.font = UIFont(name: "AirbnbCerealApp-ExtraBold", size: 30)
        classNameLabel.text = classNameLabel.text?.uppercased()
        professorNameLabel.font = UIFont(name: "AirbnbCerealApp-Medium", size: 14)
        
        bubbleView.layer.cornerRadius = 20
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
