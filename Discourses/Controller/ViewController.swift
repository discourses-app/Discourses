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
    
    @IBOutlet weak var randBtn: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var data:[String] = ["Dev","Hiren","Bhagyashree","Himanshu","Manisha","Trupti","Prashant","Kishor","Jignesh","Rushi"]
    var filterdata:[String]!
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

            filterdata = searchText.isEmpty ? data : data.filter { $0.contains(searchText) }

            //return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil

        tableView.reloadData()
    }
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myLabel.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.4352941176, blue: 0.1490196078, alpha: 1)
        myLabel.layer.cornerRadius = 43
        myLabel.layer.masksToBounds = true
        mainView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.937254902, blue: 0.8745098039, alpha: 1)
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.2156862745, green: 0.5098039216, blue: 0.6431372549, alpha: 0.43)
        searchBar.searchTextField.textColor = #colorLiteral(red: 0.1098039216, green: 0.2274509804, blue: 0.337254902, alpha: 1)
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search...",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        // Do any additional setup after loading the view.
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.937254902, blue: 0.8745098039, alpha: 1)
        tableView.dataSource = self
        searchBar.delegate = self
        filterdata = data
        
        }
    //trial commit
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
           cell.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.937254902, blue: 0.8745098039, alpha: 1)

           if filterdata.count != 0
           {
               cell.textLabel!.text = filterdata[indexPath.row]
           }
           else{
                cell.textLabel!.text = data[indexPath.row]
           }
        cell.textLabel?.font = UIFont(name: "Acme-Regular", size: 30)
        cell.textLabel?.textColor = UIColor(named: "BrandBackgroundColor")
        
           return cell
       }

}

