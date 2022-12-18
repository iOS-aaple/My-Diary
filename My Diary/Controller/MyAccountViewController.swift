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
    var userID = String()
    var password = String()
    @IBOutlet weak var personInfoContainer: UIView!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var telLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var editAccountBtn: UIButton!
    
    @IBOutlet weak var bDate: UIDatePicker!
    @IBOutlet weak var userName: UILabel!
    
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
        
        print(self.userID)
        
        users.updateUser(id: userID, name: nameLabel.text!, email: userEmail, password: password, phoneNumber: telLabel.text!, birthday:"\(bDate.date)") { data, response, error in

            let httpResponsr = response as! HTTPURLResponse
            DispatchQueue.main.async {
                if httpResponsr.statusCode == 200 {
                    print("SSS")
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let loginView = storyBoard.instantiateViewController(withIdentifier: "LoginView")
                    loginView.modalPresentationStyle = .fullScreen
                    self.present(loginView, animated: true)
                }

            }

        }
      
        
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
                              let dateFormater = DateFormatter()
                              self.password = "\(self.userInfo["password"] as! String)"
                              self.userName.text = "\(self.userInfo["name"] as! String)"
                             // dateFormater.dateFormat = "dd/mm/yyyy"
                             // self.bDate.date = dateFormater.date(from: self.userInfo["birthday"])
                            
                          }
          
                      } catch {
                          print("\(error)")
                      }
        }
    }// end of getUserData
    
}
