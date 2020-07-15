//
//  StartupViewController.swift
//  Discourses
//
//  Created by Abhishek Marda on 7/11/20.
//  Copyright © 2020 DiscoursesTeam. All rights reserved.
//

import UIKit

class StartupViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyNameLabel.alpha = 0
        companyNameLabel.font = UIFont(name: "Acme-Regular", size: 50)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (Timer) in
            //do nothing
        }
        for i in 1...100 {
            DispatchQueue.main.async {
                Timer.scheduledTimer(withTimeInterval: 0.01*Double(i), repeats: false) { (Timer) in
                    self.logoImage.layer.position.y = self.logoImage.layer.position.y - 1
                    self.logoImage.alpha = CGFloat(i)/100.0
                    if i>50 {
                        self.companyNameLabel.alpha = CGFloat(i-50)/50.0
                    }
                }
            }
                
                if i==100{
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (Timer) in
                        self.performSegue(withIdentifier: Constants.Segues.startupVCToWelcomeVC, sender: self)
                    }
                }
            
        }
        
//        UIFont.familyNames.forEach({ familyName in
//            let fontNames = UIFont.fontNames(forFamilyName: familyName)
//            print(familyName, fontNames)
//        })
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
