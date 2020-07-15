//
//  ClassSearchViewController.swift
//  Discourses
//
//  Created by Abhishek Marda on 7/15/20.
//  Copyright © 2020 DiscoursesTeam. All rights reserved.
//

import UIKit

class ClassSearchViewController: UIViewController {

    @IBOutlet weak var searchResultTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table set up
        searchResultTable.delegate = self
        searchResultTable.dataSource = self
        
        searchResultTable.register(UINib(nibName: "ChatSearchCell" /*this is the .xib name*/, bundle: nil), forCellReuseIdentifier: "ChatSearchCellIdentifier") //ADELE:this line essentially lets the table know that this exists and "registers" the cell class with it
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ClassSearchViewController : UITableViewDelegate {
    //here you can access table and it's cell's properties, such as accessing methods when the particular table cell is selected. However i would recommend setting seleection off from the storyboard; i don't think so that we need it. But upto the way you're best able to implement. For now i've set it off, but do as you please.
    
    //also, in the ChatSearchCell.swift file i've linked the button. to add actions to that button, just go to that file
    
}

extension ClassSearchViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 //ADELE: change this value once you create an array of messages, then you can return array.count to make this more abstract
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatSearchCellIdentifier") as! ChatSearchCell //this makes the cell a ChatSearchCell which will be queued into the table
        
        //probably you already know most of the below stuff, but just in case some trivial documentation
        
        //now you can access the cell's properties, such as the following line
        //cell.classNameLabel.text = "Aritra pls watch star wars one day"
        
        //I've also linked the constraint, so you can use the follwing code in case you want to increase the distance of the first row from the top
        //cell.topConstraint.constant += MAGIC_NUMBER
        
        //essentially i've linked up every element for you so you wont need to change the .xib file. in case you do, it's really just a storyboard interface so which you're already familar with
        
        return cell
    }
    
    
}
