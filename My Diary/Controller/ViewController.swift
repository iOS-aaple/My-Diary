//
//  ViewController.swift
//  My Diary
//
//  Created by Aamer Essa on 15/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
//    var imageViewHome: UIImageView = {
//        let imageViewHome = UIImageView(frame: CGRect(x:  0, y: 0, width: 150, height: 150))
//        imageViewHome.image = UIImage(named: "bloom")
//        return imageViewHome
//    }()
    
    
    
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var userNameTextFilde: UITextField!
    @IBOutlet weak var passwordTextFilde: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var passwordImage: UIImageView!
    @IBOutlet weak var signUpOutlet: UIButton!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(imageViewHome)
        self.userNameTextFilde.alpha = 0
        self.passwordTextFilde.alpha = 0
        self.loginButtonOutlet.alpha = 0
        self.passwordImage.alpha = 0
        self.signUpOutlet.alpha = 0
        self.userImage.alpha = 0
        
    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLoad()
//        imageViewHome.center = view.center
//    }
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
        }
        
//        UIView.animate(withDuration: 1, animations: {
//            let size = self.view.frame.size.width * 1.5
//            let diffx = size - self.view.frame.size.width
//            let diffy =  self.view.frame.size.height - size
//
//
//            self.imageViewHome = CGRect(x: -(diffx/2), y: diffy/2, width: size, height: size)
//
//
//
//
//        })
        
        
        
    }
        
    
    
    
    
    
    @IBAction func singUpButton(_ sender: Any) {
    }
   
    
    @IBAction func loginButton(_ sender: Any) {
    }


}

