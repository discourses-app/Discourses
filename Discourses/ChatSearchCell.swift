//
//  ChatSearchCell.swift
//  Discourses
//
//  Created by Abhishek Marda on 7/15/20.
//  Copyright © 2020 DiscoursesTeam. All rights reserved.
//

import UIKit

class ChatSearchCell: UITableViewCell {
    @IBOutlet weak var bgViewContainer: UIView!
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var professorNameLabel: UILabel!
    @IBOutlet weak var selectionButton: UIButton!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func selectButtonPressed(_ sender: UIButton) {
        print("hello")
    }
}
