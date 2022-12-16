//
//  menuViewController.swift
//  My Diary
//
//  Created by admin on 12/15/22.
//

import UIKit

protocol Menu{
    func hiddeMenu()
}

class menuViewController: UIViewController {

    var menuDelegate: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButton(_ sender: UIButton){
        menuDelegate?.hiddeMenu()
    }
    
    @IBAction func accountButton(_ sender: UIButton){
        
    }
    
    @IBAction func addNewDiaryButton(_ sender: UIButton){
       
    }
    
    @IBAction func LogOutButton(_ sender: UIButton){
        
    }

}
