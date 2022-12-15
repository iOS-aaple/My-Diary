//
//  MyAccountViewController.swift
//  My Diary
//
//  Created by Aamer Essa on 15/12/2022.
//

import UIKit

class MyAccountViewController: UIViewController {

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

    @IBAction func activateEditAccount(_ sender: Any) {
        editAccountBtn.isHidden = false
        
        nameLabel.isUserInteractionEnabled = true
        emailLabel.isUserInteractionEnabled = true
        telLabel.isUserInteractionEnabled = true
        cityLabel.isUserInteractionEnabled = true
        
    }
    @IBAction func editAccount(_ sender: Any) {
      
        
    }
}
