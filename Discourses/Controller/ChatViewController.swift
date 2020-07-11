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
    let myFunTimes : String = "hello world"
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.strokeColor: UIColor(named: "BrandForegroundColor")!]
        subjectLabel.font = UIFont(name: "Acme-Regular", size: 30)
        subjectLabel.text = subjectLabel.text?.uppercased()
        
        chatTable.layer.cornerRadius = 40
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("going back")
        }
    }
    
    
    
}

