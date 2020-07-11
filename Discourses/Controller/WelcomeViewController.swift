//
//  WelcomeViewController.swift
//  Discourses
//
//  Created by Abhishek Marda on 7/10/20.
//  Copyright © 2020 DiscoursesTeam. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var loginView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var pwdText: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.setTitle("Login", for: .normal)
        loginView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.937254902, blue: 0.8745098039, alpha: 1)
        loginBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.4352941176, blue: 0.1490196078, alpha: 1)
        loginBtn.layer.cornerRadius = 20
        loginBtn.layer.masksToBounds = true
        loginBtn.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.937254902, blue: 0.8745098039, alpha: 1), for: .normal)
        
        signUpBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.4352941176, blue: 0.1490196078, alpha: 1)
        signUpBtn.layer.cornerRadius = 20
        signUpBtn.layer.masksToBounds = true
        signUpBtn.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.937254902, blue: 0.8745098039, alpha: 1) , for: .normal)
       
        pwdText.isSecureTextEntry = true
        
        pwdText.layer.cornerRadius = 20
        usernameText.layer.cornerRadius = 20
        
        pwdText.layer.masksToBounds = true
        usernameText.layer.masksToBounds = true
        
        // Do any additional setup after loading the view.
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
