//
//  ViewController.swift
//  My Diary
//
//  Created by Aamer Essa on 15/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
        var imageViewHome: UIImageView = {
            let imageViewHome = UIImageView(frame: CGRect(x:  0, y: 0, width: 250, height: 250))
            imageViewHome.image = UIImage(named: "bloomHom")
            return imageViewHome
        }()
    
    
    
    
    // MARK: - @IBOutlets
    
   
    @IBOutlet weak var forgetPasswordBtn: UIButton!
    @IBOutlet weak var helloText: UILabel!
    @IBOutlet weak var wrongMessageLabel: UILabel!
    @IBOutlet weak var userNameTextFilde: UITextField!
    @IBOutlet weak var passwordTextFilde: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var passwordImage: UIImageView!
    @IBOutlet weak var signUpOutlet: UIButton!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var faceBookImage: UIImageView!
    @IBOutlet weak var twiterImage: UIImageView!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var googleImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageViewHome)
        animationStart()
        self.userNameTextFilde.alpha = 0
        self.passwordTextFilde.alpha = 0
        self.loginButtonOutlet.alpha = 0
        self.passwordImage.alpha = 0
        self.signUpOutlet.alpha = 0
        self.userImage.alpha = 0
        self.forgetPasswordBtn.alpha = 0
        self.helloText.alpha = 0
        faceBookImage.alpha = 0
        twiterImage.alpha = 0
        orLabel.alpha = 0
        googleImage.alpha = 0
        
        wrongMessageLabel.isHidden = true
        
    }
        override func viewDidLayoutSubviews() {
            super.viewDidLoad()
            imageViewHome.center = view.center
        }
    override func viewDidAppear(_ animated: Bool) {
        animations()
    }
    func animations(){
        
        UIView.animate(withDuration: 2 ){
            self.userNameTextFilde.alpha = 1
            self.passwordTextFilde.alpha = 1
            self.loginButtonOutlet.alpha = 1
            self.passwordImage.alpha = 1
            self.signUpOutlet.alpha = 1
            self.userImage.alpha = 1
            self.forgetPasswordBtn.alpha = 1
            self.helloText.alpha = 1
            self.faceBookImage.alpha = 1
            self.twiterImage.alpha = 1
            self.orLabel.alpha = 1
            self.googleImage.alpha = 1
        }
        
        
        
    }
    func animationStart(){
        
                UIView.animate(withDuration: 1, animations: {
                    let size = self.view.frame.size.width * 1.5
                    let diffx = size - self.view.frame.size.width
                    let diffy =  self.view.frame.size.height - size
        
        
                    self.imageViewHome.frame = CGRect(x: -(diffx/2), y: diffy/2, width: size, height: size)
                    self.imageViewHome.alpha = 0
        })
        
    }
    
    @IBAction func singUpButton(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let singUpVC = storyBoard.instantiateViewController(withIdentifier: "sinUpView") as! signUpViewController
        
        singUpVC.modalPresentationStyle = .fullScreen
        present(singUpVC, animated: true)
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        users.login(email: userNameTextFilde.text!, password: passwordTextFilde.text!) { data, response, error in
            do{
                let httpResponsr = response as! HTTPURLResponse
                
                DispatchQueue.main.async {
                    
                    if httpResponsr.statusCode == 200 {
                        
                        let email = self.userNameTextFilde.text!
                        self.wrongMessageLabel.isHidden = true
                        self.getUserID(email: email)
                    }
                    else{
                        self.wrongMessageLabel.isHidden = false
                    }
                } // end of DispatchQueue
                
            }
            catch{
                print("\(error)")
            }
        }
        
        
    } // end of loginButton()
    
    @IBAction func forgetPassowrd(_ sender: Any) {
        let storyboard = storyboard?.instantiateViewController(withIdentifier: "ForgetPasswordView")
        storyboard?.modalPresentationStyle = .fullScreen
        present(storyboard!, animated: true)
    }
    
    func getUserID(email:String){
        var userID = String()
        users.getUserData(email: email) { data, response, error in
            do{
                let user = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                DispatchQueue.main.async {
                    
                    userID = user!["_id"] as! String
                    print(userID)
                    let sroryBoard = UIStoryboard(name: "Main", bundle: nil)
                    let homeView = sroryBoard.instantiateViewController(withIdentifier: "homeDiary") as! diaryViewController
                    homeView.userEmail = email
                    homeView.userID = user!["_id"] as! String
                    homeView.modalPresentationStyle = .fullScreen
                    self.present(homeView, animated: true)
                    
                }
                
            } catch{
                print("\(error)")
            }
        }
     
    }
}

