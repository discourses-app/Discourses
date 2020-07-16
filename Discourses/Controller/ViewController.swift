//
//  ChatViewController.swift
//  Discourses
//
//  Created by Abhishek Marda on 7/9/20.
//  Copyright © 2020 DiscoursesTeam. All rights reserved.
//

import UIKit
import QuartzCore
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdata.count
    }
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var addClassLbl: UILabel!
    @IBOutlet weak var randBtn: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var data:[String] = ["CS 180","CS 35L","PSYCH 100A","PSYCH 100A","PSYCH 100B","PSYCH 100C","PSYCH 100D","Kishor","Jignesh","Rushi"]
    var filterdata:[String]!
    var selectedCell : IndexPath!
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

            filterdata = searchText.isEmpty ? data : data.filter { $0.contains(searchText) }

            //return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil

        tableView.reloadData()
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        backBtn.setImage(#imageLiteral(resourceName: "backBtn"), for: .normal)
        bgView.layer.cornerRadius = 35
        bgView.layer.masksToBounds = true
        bgView.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.4352941176, blue: 0.1490196078, alpha: 1)
        searchBar.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.4352941176, blue: 0.1490196078, alpha: 1)
        self.mainView.sendSubviewToBack(bgView)
        addClassLbl.textColor = #colorLiteral(red: 0.8117647059, green: 0.4352941176, blue: 0.1490196078, alpha: 1)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //myLabel.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.4352941176, blue: 0.1490196078, alpha: 1)
//        myLabel.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.2274509804, blue: 0.337254902, alpha: 1)
//        myLabel.layer.cornerRadius = 43
//        myLabel.layer.masksToBounds = true
        mainView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.937254902, blue: 0.8745098039, alpha: 1)
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.937254902, blue: 0.8745098039, alpha: 1)
        searchBar.searchTextField.textColor = #colorLiteral(red: 0.8117647059, green: 0.4352941176, blue: 0.1490196078, alpha: 1)
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search...",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8117647059, green: 0.4352941176, blue: 0.1490196078, alpha: 1)])
        // Do any additional setup after loading the view.
        tableView.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.4352941176, blue: 0.1490196078, alpha: 1)
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.delegate = self
        filterdata = data
        tableView.separatorStyle = .none
        
        }
    //trial commit
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let joinBtn = UIImageView(frame: CGRect(x: 300, y: 30, width: 40, height: 40))
        joinBtn.image = #imageLiteral(resourceName: "addImage")
       let tap = UITapGestureRecognizer()
        joinBtn.addGestureRecognizer(tap)
        joinBtn.tag = 1
        cell.contentView.addSubview(joinBtn)
        let profLabel = UILabel(frame: CGRect(x: 25, y: 60, width: 150, height: 20))
        profLabel.text = "Prof. Yerl Ame"
        profLabel.textColor = #colorLiteral(red: 0.9490196078, green: 0.937254902, blue: 0.8745098039, alpha: 1)
        profLabel.textAlignment = .left
        profLabel.font =  UIFont(name: "Acme-Regular", size: 18)
          cell.contentView.addSubview(profLabel)
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        cell.textLabel?.layer.cornerRadius = 20
        cell.textLabel?.layer.masksToBounds = true
        let bg = UIView()
        bg.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bg
           cell.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.4352941176, blue: 0.1490196078, alpha: 1)

           if filterdata.count != 0
           {
               cell.textLabel!.text = filterdata[indexPath.row]
            cell.textLabel?.textAlignment = .left
           }
           else{
                cell.textLabel!.text = data[indexPath.row]
              cell.textLabel?.textAlignment = .left
           }
        cell.textLabel?.font = UIFont(name: "Acme-Regular", size: 30)
        cell.textLabel?.textColor = #colorLiteral(red: 0.9490196078, green: 0.937254902, blue: 0.8745098039, alpha: 1)
           return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("This cell from the chat list was selected: \(indexPath.row)")
        let cell = tableView.cellForRow(at: indexPath)
        UIView.transition(with: (cell?.viewWithTag(1) as! UIImageView),
        duration: 0.75,
        options: .transitionCrossDissolve,
        animations: { (cell?.viewWithTag(1) as! UIImageView).image = #imageLiteral(resourceName: "checkMark") },
        completion: nil)
        let className = cell!.textLabel!.text!
        print(className)
        //ADD CLASS NAME TO personal LIST HERE
        //self.performSegue(withIdentifier: "toChatView", sender: self)
        //(cell?.viewWithTag(1) as! UIImageView).image = #imageLiteral(resourceName: "doneAdding")
        selectedCell = indexPath
    }

}

