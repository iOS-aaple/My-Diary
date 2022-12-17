//
//  MyAccountViewController.swift
//  My Diary
//
//  Created by Aamer Essa on 15/12/2022.
//

import UIKit

class MyAccountViewController: UIViewController {

    var userEmail = String()
    var userInfo = NSDictionary()
    @IBOutlet weak var personInfoContainer: UIView!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var telLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var editAccountBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       personInfoContainer.layer.cornerRadius = 20
        editAccountBtn.isHidden = true
        getUserData()

    }
    

  
    // MARK: - Action

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segue = segue.destination as! diaryViewController
        segue.userEmail = userEmail
    }
  
    @IBAction func activateEditAccount(_ sender: Any) {
        editAccountBtn.isHidden = false
        
        nameLabel.isUserInteractionEnabled = true
        emailLabel.isUserInteractionEnabled = true
        telLabel.isUserInteractionEnabled = true
        cityLabel.isUserInteractionEnabled = true
        
    }
    @IBAction func editAccount(_ sender: Any) {
      
        
    }
    
    func getUserData(){
        users.getUserData(email: userEmail) { data, response, error in
            
            do{
                let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                
                          DispatchQueue.main.async {
                             
                              self.userInfo = jsonResult!
                              self.nameLabel.text = "\(self.userInfo["name"] as! String)"
                              self.emailLabel.text = "\(self.userInfo["email"] as! String)"
                              self.telLabel.text = "\(self.userInfo["phoneNumber"] as! String)"
                              self.nameLabel.text =  "\(self.userInfo["name"] as! String)"
                            
                          }
          
                      } catch {
                          print("\(error)")
                      }
        }
    }// end of getUserData
    
}
