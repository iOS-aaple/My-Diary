//
//  signUpViewController.swift
//  My Diary
//
//  Created by mohammed alsaad on 15/12/2022.
//

import UIKit

class signUpViewController: UIViewController {

    //MARK: - IBOutlet
      
    @IBOutlet weak var wrongMassageLabel: UILabel!
    @IBOutlet weak var signupOptions: UIStackView!
    @IBOutlet weak var orText: UILabel!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
      @IBOutlet weak var emailTextField: UITextField!
      @IBOutlet weak var phoneNumberTextField: UITextField!
      @IBOutlet weak var dateOfBirthTextField: UIDatePicker!
      @IBOutlet weak var newPasswordTextField: UITextField!
      @IBOutlet weak var reWritePasswordTextField: UITextField!
      @IBOutlet weak var profileImage: UIImageView!
      @IBOutlet weak var pass2Image: UIImageView!
      @IBOutlet weak var pass1Image: UIImageView!
      @IBOutlet weak var calenderImage: UIImageView!
      @IBOutlet weak var emailImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wrongMassageLabel.isHidden = true
        self.userNameTextField.alpha = 0
        self.emailTextField.alpha = 0
        self.dateOfBirthTextField.alpha = 0
        self.newPasswordTextField.alpha = 0
        self.reWritePasswordTextField.alpha = 0
        self.profileImage.alpha = 0
        self.pass1Image.alpha = 0
        self.pass2Image.alpha = 0
        self.calenderImage.alpha = 0
        self.emailImage.alpha = 0
        self.phoneNumberTextField.alpha = 0
        self.signupBtn.alpha = 0
        self.orText.alpha = 0
        self.signupOptions.alpha = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        animations2()
    }
    
    
    func animations2(){
        UIView.animate(withDuration: 1.3){
            self.userNameTextField.alpha = 1
            self.emailTextField.alpha = 1
            self.dateOfBirthTextField.alpha = 1
            self.newPasswordTextField.alpha = 1
            self.reWritePasswordTextField.alpha = 1
            self.profileImage.alpha = 1
            self.pass1Image.alpha = 1
            self.pass2Image.alpha = 1
            self.calenderImage.alpha = 1
            self.emailImage.alpha = 1
            self.phoneNumberTextField.alpha = 1
            self.signupBtn.alpha = 1
            self.orText.alpha = 1
            self.signupOptions.alpha = 1
            
        }
        
        
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        if newPasswordTextField.text != reWritePasswordTextField.text{
            wrongMassageLabel.isHidden = false
        }
        else{
            wrongMassageLabel.isHidden = true
       
        let dateOfBirth = "\(dateOfBirthTextField.date)"
        users.signup(name: userNameTextField.text!, email: emailTextField.text!, password: newPasswordTextField.text!, phoneNumber:phoneNumberTextField.text! , birthday: dateOfBirth) { data, response, error in
            
            do{
                let httpResponsr = response as! HTTPURLResponse
                
                DispatchQueue.main.async {
                    self.navigationController?.popToRootViewController(animated: true)
                }
                
            }catch{
                print("\(error)")
            }
        
        }
        }
    }/// end signUpButton() 
    
    

    

}
