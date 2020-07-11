//
//  ChatViewController.swift
//  Discourses
//
//  Created by Abhishek Marda on 7/9/20.
//  Copyright © 2020 DiscoursesTeam. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var chatTable: UITableView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var inputField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.strokeColor: UIColor(named: "BrandForegroundColor")!]
        subjectLabel.font = UIFont(name: "Acme-Regular", size: 30)
        subjectLabel.text = subjectLabel.text?.uppercased()
        
        
        chatTable.layer.cornerRadius = 40
        inputField.layer.masksToBounds = true
        inputField.layer.cornerRadius = 15
        
//        let attachmentButton = UIButton(type: .custom)
//        attachmentButton.setImage(UIImage(systemName: "paperclip"), for: .normal)
//        attachmentButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
//        attachmentButton.frame = CGRect(x: CGFloat(txt.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
//        attachmentButton.addTarget(self, action: #selector(self.attachmentButtonPressed(_:)), for: .touchUpInside)
//        inputField.rightView = attachmentButton
//        inputField.rightViewMode = .always
    }
    
    @IBAction func attachmentButtonPressed(_ sender: UIButton){
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("Dismissing current view controller")
        }
    }
    
    
    
}

