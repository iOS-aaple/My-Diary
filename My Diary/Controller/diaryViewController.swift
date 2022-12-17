//
//  diaryViewController.swift
//  My Diary
//
//  Created by admin on 12/15/22.
//

import UIKit

class diaryViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var addDiaryButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var trailingMenuConstant: NSLayoutConstraint!
    
    //MARK: - Vars
    var userEmail = String()
    var menuVC: menuViewController?
    var isMenuShown = false
    var diary: [NSDictionary] = []
    var userID = "111"
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
           setUI()
        getPosts()
     // deletePost()
//        editPost()
        addNewPost()
        }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    //MARK: - Function
    private func setUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
    
        backgroundView.isHidden = true
        addDiaryButton.layer.cornerRadius = 15
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappingToBackView))
        tap.numberOfTapsRequired = 1
        backgroundView.addGestureRecognizer(tap)
        
        checkisEmpty()
     
        
        
    }
    
    func checkisEmpty(){
        if diary .isEmpty{
            collectionView.isHidden = true
            emptyView.isHidden = false
        } else{
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
    
    func getPosts(){
        posts.getAllPosts(id: "111") { data, response, error in
            do{
                if let jsonResul = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray{
                   
                    for post in jsonResul {
                        let pp = post as! NSDictionary
                        self.diary.append(pp)
                    }
                    print(jsonResul)
                    DispatchQueue.main.async {
                        self.checkisEmpty()
                        
                        self.collectionView.reloadData()
                    }
                }
                
                
                
            }catch {
                print("\(error)")
            }
        }
    }
    
    func deletePost(){
        
        posts.deletePost(id: "639e128c69c7f976264d18a9") { data, response, error in
            let httpRespons = response as! HTTPURLResponse
            
            print(httpRespons.statusCode)
        }
    }
    
    func editPost(){
        posts.updatePost(id: "639e14b453c9c8921dae6687", ownerId: "111", title: "Asa", created_At: "2022-10-10", content: "SSSSSSSSS") { data, respons, error in
            do{
                let httpResponse = respons as! HTTPURLResponse
                DispatchQueue.main.async {
                    if httpResponse.statusCode == 200 {
                        print(httpResponse.statusCode)
                    }
                }
            }
        }
    }
    
    func addNewPost(){
        
        posts.AddNewPost(ownerId: "111", title: "Asa", created_At: "2022-10-10", content: "SSSSSSSSS") { data, respons, error in
            do{
                let httpResponse = respons as! HTTPURLResponse
                DispatchQueue.main.async {
                    if httpResponse.statusCode == 200 {
                        print(httpResponse.statusCode)
                    }
                }
            }
        }
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension diaryViewController: Menu{
    func hiddeMenu(){
        self.hiddeMenuView()
        
    }
    
}
