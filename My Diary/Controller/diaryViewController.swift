//
//  diaryViewController.swift
//  My Diary
//
//  Created by admin on 12/15/22.
//

import UIKit

class diaryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var trailingMenuConstant: NSLayoutConstraint!
    
    var menuVC: menuViewController?
    var isMenuShown = false
    override func viewDidLoad() {
        super.viewDidLoad()
           setUI()
        }
    
    private func setUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
    
        backgroundView.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappingToBackView))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "sideMenu")
        {
            if let controller = segue.destination as? menuViewController
            {
                self.menuVC = controller
                self.menuVC?.menuDelegate = self
            }
        }
    }
    
    @objc func tappingToBackView(){
//        hiddeMenuView()
    }
    
    private func hiddeMenuView(){

        UIView.animate(withDuration: 0.1) {
            self.trailingMenuConstant.constant = 10
            self.view.layoutIfNeeded()
        } completion: { (status) in
            self.backgroundView.alpha = 0.0
            UIView.animate(withDuration: 0.1) {
                self.trailingMenuConstant.constant = 190
                self.view.layoutIfNeeded()
            } completion: { (status) in
                self.backgroundView.isHidden = true
                self.isMenuShown = false
            }
        }
    }
    
    @IBAction func presentMenu(_ sender: UIButton){
        UIView.animate(withDuration: 0.1) {
            self.trailingMenuConstant.constant = 10
            self.view.layoutIfNeeded()
        } completion: { (status) in
            self.backgroundView.alpha = 0.75
            self.backgroundView.isHidden = false
            UIView.animate(withDuration: 0.1) {
                self.trailingMenuConstant.constant = 0
                self.view.layoutIfNeeded()
            } completion: { (status) in
                self.isMenuShown = true
            }

        }

        self.backgroundView.isHidden = false
    }
    
    
    
   

}


extension diaryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "diaryCell", for: indexPath) as! diaryCell
       cell.viewCell.layer.cornerRadius = 20
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height * 0.12)

    }
    
}

extension diaryViewController: Menu{
    func hiddeMenu(){
        self.hiddeMenuView()
        
    }
    
}
