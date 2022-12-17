//
//  ForgetPasswordViewController.swift
//  My Diary
//
//  Created by Aamer Essa on 17/12/2022.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextFiled: UITextField!
    @IBOutlet weak var wrongMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
         
        wrongMessage.isHidden = true
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

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func AuthUser(_ sender: Any) {
        users.auth(name: nameTextFiled.text!, email: emailTextField.text!) { data, response, error in
            
            let httpResponsr = response as! HTTPURLResponse
            
            DispatchQueue.main.async {
                
                if httpResponsr.statusCode == 200 {
                    self.wrongMessage.isHidden = true
                    print("SS")
                } else{
                    self.wrongMessage.isHidden = false
                }
            }
           
        }
    }
}
