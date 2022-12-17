//
//  LNViewController.swift
//  My Diary
//
//  Created by mohammed alsaad on 17/12/2022.
//

import UIKit

class LNViewController: UIViewController {

    @IBOutlet weak var bloomImage: UIImageView!
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 2.0, animations: {
            self.bloomImage.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.size.height)
            
        }) {(seccess) in
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = vc
        }
    }
}
