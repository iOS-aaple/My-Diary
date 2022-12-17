//
//  diaryViewController.swift
//  My Diary
//
//  Created by admin on 12/15/22.
//

import UIKit

class diaryViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addDiaryButton: UIButton!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var trailingMenuConstant: NSLayoutConstraint!
    
    //MARK: - Vars
    var userEmail = String()
    var menuVC: menuViewController?
    var isMenuShown = false
    var diary: [Int] = []
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
           setUI()
       
        }
    
    //MARK: - Function
    private func setUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
    
        backgroundView.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappingToBackView))
        tap.numberOfTapsRequired = 1
        backgroundView.addGestureRecognizer(tap)
        addDiaryButton.layer.cornerRadius = 15
        
        if diary .isEmpty{
            collectionView.isHidden = true
            emptyView.isHidden = false
        } else {
            collectionView.isHidden = false
            emptyView.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "sideMenu")
        {
            if let controller = segue.destination as? menuViewController
            {
                controller.userEmail = userEmail
                self.menuVC = controller
                self.menuVC?.menuDelegate = self
            }
        }
    }
    
    @objc func tappingToBackView(){
        hiddeMenuView()
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
    
    //MARK: - IBAction
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
    
    
    
    @IBAction func addDiary(_ sender: Any) {
    }
    
   

}


extension diaryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        diary.count
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
