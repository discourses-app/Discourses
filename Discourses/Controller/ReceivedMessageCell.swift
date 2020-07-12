//
//  ReceivedMessageCell.swift
//  Discourses
//
//  Created by Abhishek Marda on 7/12/20.
//  Copyright © 2020 DiscoursesTeam. All rights reserved.
//

import UIKit

class ReceivedMessageCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var messageContent: UILabel!
    @IBOutlet weak var messageBackground: UIView!
    @IBOutlet weak var senderText: UILabel!
    @IBOutlet weak var bufferView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        
        messageBackground.layer.cornerRadius = messageBackground.frame.size.height / 5
        messageBackground.layer.masksToBounds = false
        messageBackground.layer.shadowColor = UIColor.black.cgColor
        messageBackground.layer.shadowOpacity = 0.1
        messageBackground.layer.shadowOffset = CGSize(width: 1.5, height: 5)
        messageBackground.layer.shadowRadius = 1
        messageBackground.layer.shouldRasterize = true
        messageBackground.layer.rasterizationScale = true ? UIScreen.main.scale : 1

        
        messageContent.font = UIFont(name: "Cabin-Regular", size: 19)
        messageContent.textColor = hexStringToUIColor(hex: "#1C3A56")
        senderText.font = UIFont(name: "Cabin-Regular", size: 13)
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
