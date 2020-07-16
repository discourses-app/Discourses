//
//  SubscribedClassesViewController.swift
//  Discourses
//
//  Created by Abhishek Marda on 7/15/20.
//  Copyright © 2020 DiscoursesTeam. All rights reserved.
//

import UIKit

class SubscribedClassesViewController: UIViewController {
    @IBOutlet weak var myCoursesLabel: UILabel!
    @IBOutlet weak var addChatButton: UIButton!
    @IBOutlet weak var classListTable: UITableView!
    @IBOutlet weak var threeLinesImage: UIButton!
    
    let bubbleBgColors : [UIColor] = [
        UIColor(named: "BubbleColor1")!,
        UIColor(named: "BubbleColor2")!,
        UIColor(named: "BubbleColor3")!,
        UIColor(named: "BubbleColor4")!
    ]
    
    let classes : [Class] = [
        Class(name: "Psych 100A", professor: "Professor Mudane"),
        Class(name: "Ling 120B", professor: "Professor Sawtelle"),
        Class(name: "MGMT 100A", professor: "Professor Marugame"),
        Class(name: "ComSci 180", professor: "Professor Sarrafzadeh"),
        Class(name: "Physics 1C", professor: "Why are you taking Corbin")
    ]
    
    var selectedCellIndex : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table view set up
        classListTable.delegate = self
        classListTable.dataSource = self
        classListTable.layer.cornerRadius = 43
        classListTable.register(UINib(nibName: Constants.CellStructNames.classBubble, bundle: nil), forCellReuseIdentifier: Constants.CellIdentifiers.classBubble)
        
//        threeLinesImage.frame = CGRect(
//            x: threeLinesImage.layer.position.x,
//            y: threeLinesImage.layer.position.y,
//            width: threeLinesImage.frame.width,
//            height: threeLinesImage.frame.height + 10)
//        threeLinesImage.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        threeLinesImage.layer.masksToBounds = true
//        threeLinesImage.sizeToFit()
        let image = #imageLiteral(resourceName: "ThreeLines").resized(to: CGSize(width: 25, height: 22))
        threeLinesImage.setImage(image, for: .normal)
        
//        threeLinesImage.setImage(., for: .normal)
        //label set up
        myCoursesLabel.font = UIFont(name: "AirbnbCerealApp-ExtraBold", size: 36)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = selectedCellIndex {
            classListTable.cellForRow(at: indexPath)?.alpha = 1
            selectedCellIndex = nil
        }
    }
}

extension SubscribedClassesViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.alpha = 0.5
        tableView.deselectRow(at: indexPath, animated: true)
        selectedCellIndex = indexPath
        performSegue(withIdentifier: Constants.Segues.classListVCToChatVC, sender: self)

    }
    
    
}

extension SubscribedClassesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bgColorForCell = bubbleBgColors[indexPath.row % 4]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.classBubble) as! ClassBubbleTableViewCell
        cell.classNameLabel.text = classes[indexPath.row].name.uppercased()
        cell.professorNameLabel.text = classes[indexPath.row].professor
        cell.bubbleView.backgroundColor = bgColorForCell
        
        if indexPath.row == 0 {
            cell.bubbleTopConstraint.constant += 20
        }
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        
        
        return cell
        
    }
    
    
}

