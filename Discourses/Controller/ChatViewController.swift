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
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var professorLabel: UILabel!
    
    var messages : [Message] = [
        Message(
            from: Sender(withName: "Janardhan", withProfilePic: #imageLiteral(resourceName: "BrandColoredLogo")),
            on: Date(timeIntervalSince1970: Date.timeIntervalSinceReferenceDate),
            withMessage: "Hi"
        ),
        Message(
            from: Sender(withName: "Jonathon", withProfilePic: #imageLiteral(resourceName: "DiscoursesLogo")),
            on: Date(timeIntervalSince1970: Date.timeIntervalSinceReferenceDate),
            withMessage: "I'm doing well, how about yourself?"
        ),
        Message(
            from: Sender(withName: "Janardhan", withProfilePic: #imageLiteral(resourceName: "BrandColoredLogo")),
            on: Date(timeIntervalSince1970: Date.timeIntervalSinceReferenceDate),
            withMessage: "Did you ever hear the Tragedy of Wise? I thought not, it's not a story the Jedi would tell you. It's a sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life... He had such a knowledge of the dark side that he could even keep the ones he cared about from dying."
        ),
        Message(
            from: Sender(withName: "Chamiya", withProfilePic: #imageLiteral(resourceName: "NoBgLogo")),
            on: Date(timeIntervalSince1970: Date.timeIntervalSinceReferenceDate),
            withMessage: "Okay..."
        ),
        Message(
            from: Sender(withName: "Janardhan", withProfilePic: #imageLiteral(resourceName: "BrandColoredLogo")),
            on: Date(timeIntervalSince1970: Date.timeIntervalSinceReferenceDate),
            withMessage: "The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful... the only thing he was afraid of was losing his power, which eventually, of course, he did. "
        ),
        Message(
            from: Sender(withName: "Chamiya", withProfilePic: #imageLiteral(resourceName: "NoBgLogo")),
            on: Date(timeIntervalSince1970: Date.timeIntervalSinceReferenceDate),
            withMessage: "Bro I'm begging you pls stop"
        )
    ]
    
    var sender : String = "Janardhan"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //subject label set up
        subjectLabel.font = UIFont(name: "AirbnbCerealApp-Book", size: 30)
        subjectLabel.text = subjectLabel.text?.uppercased()
        
        //professor label set up
        professorLabel.font = UIFont(name: "AirbnbCerealApp-Book", size: 14)
        
        
        //chat table view set up
        chatTable.layer.cornerRadius = 40
        chatTable.register(UINib(nibName: Constants.CellStructNames.messageCell, bundle: nil), forCellReuseIdentifier: Constants.CellIdentifiers.messageCell)
        chatTable.register(UINib(nibName: Constants.CellStructNames.sentCell, bundle: nil), forCellReuseIdentifier: Constants.CellIdentifiers.sentCell)
        chatTable.delegate = self
        chatTable.dataSource = self

        //input text field set up
        let attachmentButton = UIButton(type: .custom)
        attachmentButton.setImage(UIImage(systemName: "paperclip"), for: .normal)
        attachmentButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        attachmentButton.frame = CGRect(x: 0, y: 0, width: ((inputField.frame.width)), height: ((inputField.frame.height)))
        attachmentButton.addTarget(self, action: #selector(self.attachmentButtonPressed(_:)), for: .touchUpInside)
        inputField.rightView = attachmentButton
        inputField.rightViewMode = .always
        inputField.layer.masksToBounds = true
        inputField.layer.cornerRadius = 15
        
        
        //menu button set up
        let menuimage = #imageLiteral(resourceName: "ThreeLines").resized(to: CGSize(width: 25, height: 20))
        menuButton.setImage(
            menuimage,
            for: .normal
        )
        
        //back button set up
        backButton.setImage(
            UIImage(
                systemName: "arrow.left",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)
            ),
            for: .normal
        )
        
    }
    
    //MARK: - Button actions
    
    @IBAction func attachmentButtonPressed(_ sender: UIButton){
        print("hello")
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("Dismissing current view controller")
        }
    }
    
    //MARK: - Helpers
    
    
    func scrollToBottom(){
        DispatchQueue.main.async {
           
            let indexPath = IndexPath(row:  self.chatTable.numberOfRows(inSection: 0) - 1, section: 0)
            self.chatTable.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
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

extension ChatViewController: UITableViewDelegate {
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.messageCell) as! ReceivedMessageCell
//        cell.messageContent.text = messages[indexPath.row].content
//        cell.profileImage.image = messages[indexPath.row].sender.profilepic
//        cell.senderText.text = messages[indexPath.row].sender.name
//        cell.leftBufferView.isHidden = true
//        if messages[indexPath.row].sender.name == sender {
//            cell.bufferView.isHidden = true
//            cell.leftBufferView.isHidden = false
//            cell.messageBackground.backgroundColor = hexStringToUIColor(hex: "#3782A4")
//            cell.profileImage.alpha = 0
//            cell.senderText.isHidden = true
//            cell.messageContent.textColor = hexStringToUIColor(hex: "#FCFAF3")
//
//        }
//        return cell
        
        if sender == messages[indexPath.row].sender.name {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.sentCell) as! SentMessageCell
            cell.contentLabel.text = messages[indexPath.row].content
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.messageCell) as! ReceivedMessageCell
            cell.messageContent.text = messages[indexPath.row].content
            cell.profileImage.image = messages[indexPath.row].sender.profilepic
            cell.senderText.text = messages[indexPath.row].sender.name
//            cell.leftBufferView.isHidden = true
            return cell
        }
    }
    
    
    
}

