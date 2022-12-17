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
   var userEmail = String()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MyAccount"{
            let myAccountView = segue.destination as! MyAccountViewController
            myAccountView.userEmail =  userEmail
            
        }
        if segue.identifier == "NewDiary"{
            print("NewDiary")
        }
    }
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
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginView = storyBoard.instantiateViewController(withIdentifier: "LoginView")
        loginView.modalPresentationStyle = .fullScreen
        present(loginView, animated: true)
    }

}
