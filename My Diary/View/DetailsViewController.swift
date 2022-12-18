//
//  DetailsViewController.swift
//  My Diary
//
//  Created by Munira on 16/12/2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        animateView()
    }
    
    // MARK: - set UI
    func setUpUI(){
        backgroundView.alpha = 0
        backgroundView.layer.cornerRadius = 40
    }
    //MARK: - animate view
    func animateView(){
        UIView.animate(withDuration: 1.5) {
            self.backgroundView.alpha = 1
        }
        UIView.animate(withDuration: 1) {
            self.backgroundView.center.y -= 50
        } completion: { _ in
            
        }
    }
    
    
    
    @IBAction func editButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "AddEdit", bundle: nil)
        let editDetails = storyBoard.instantiateViewController(withIdentifier: "AddEdit")
        editDetails.modalPresentationStyle = .fullScreen
        present(editDetails, animated: true)
    }
    
}
