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

    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var professorLabel: UILabel!
    
    var messages : [Message] = [
        Message(from: "Janardhan", on: Date(timeIntervalSince1970: Date.timeIntervalSinceReferenceDate), withMessage: "Hi, how are you jonathon"),
        Message(from: "Jonathon", on: Date(timeIntervalSince1970: Date.timeIntervalSinceReferenceDate), withMessage: "I'm doing well, how about yourself?"),
        Message(from: "Janardhan", on: Date(timeIntervalSince1970: Date.timeIntervalSinceReferenceDate), withMessage: "Did you ever hear the Tragedy of Wise? I thought not, it's not a story the Jedi would tell you. It's a sith legend. Darth Plageuis was a dark lord of the sith. He was so powerful and wise...")
    ]
    
    var sender : String = "Janardhan"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //subject label set up
        subjectLabel.font = UIFont(name: "Acme-Regular", size: 30)
        subjectLabel.text = subjectLabel.text?.uppercased()
        
        //professor label set up
        professorLabel.font = UIFont(name: "Cabin-Regular", size: 17)
        
        
        //chat table view set up
        chatTable.layer.cornerRadius = 40
        chatTable.register(UINib(nibName: "ReceivedMessageCell", bundle: nil), forCellReuseIdentifier: "ReceiveMessageIdentifier")
        chatTable.delegate = self
        chatTable.dataSource = self

        //input view field set up
        inputTextView.delegate = self
        let attachmentButton = UIButton(type: .custom)
        attachmentButton.setImage(UIImage(systemName: "paperclip"), for: .normal)
        attachmentButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        attachmentButton.frame = CGRect(x: 0, y: 0, width: ((inputTextView.frame.width)), height: ((inputTextView.frame.height)))
        attachmentButton.addTarget(self, action: #selector(self.attachmentButtonPressed(_:)), for: .touchUpInside)
//        inputTextView.rightView = attachmentButton
//        inputField.rightViewMode = .always
        inputTextView.layer.masksToBounds = true
        inputTextView.layer.cornerRadius = 15
        inputTextView.insertTextPlaceholder(with: CGSize(width: 10, height: 10))
        
        //menu button set up
        menuButton.setImage(
            UIImage(
                systemName: "line.horizontal.3",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)
            ),
            for: .normal
        )
        
        //back button set up
        backButton.setImage(
            UIImage(
                systemName: "arrow.left",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 20)
            ),
            for: .normal
        )
        
    }
    
    @IBAction func attachmentButtonPressed(_ sender: UIButton){
        print("hello")
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("Dismissing current view controller")
        }
    }
    
    //MARK: - Helpers
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
//MARK: - TextViewDelegate
extension ChatViewController : UITextViewDelegate {
    
}

//MARK: - TableViewDelegate

extension ChatViewController: UITableViewDelegate {
    
}

//MARK: - TableViewDataSource


extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiveMessageIdentifier") as! ReceivedMessageCell
        cell.messageContent.text = messages[indexPath.row].content
        cell.profileImage.image = #imageLiteral(resourceName: "DiscoursesLogo")
        cell.senderText.text = messages[indexPath.row].sender
        
        if messages[indexPath.row].sender == sender {
            cell.bufferView.isHidden = true
            cell.messageBackground.backgroundColor = hexStringToUIColor(hex: "#3782A4")
            cell.profileImage.alpha = 0
            cell.senderText.isHidden = true
            cell.messageContent.textColor = hexStringToUIColor(hex: "#FCFAF3")
        }
        return cell
    }
    
    
}
