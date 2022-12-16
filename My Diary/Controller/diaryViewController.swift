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
    override func viewDidLoad() {
        super.viewDidLoad()
            collectionView.delegate = self
            collectionView.dataSource = self
        
            backgroundView.isHidden = true
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
    
    private func hiddeMenuView(){
        self.backgroundView.isHidden = true
        self.trailingMenuConstant.constant = 190
        
    }
    
    @IBAction func presentMenu(_ sender: UIButton){
        backgroundView.isHidden = false
        trailingMenuConstant.constant = 0
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
