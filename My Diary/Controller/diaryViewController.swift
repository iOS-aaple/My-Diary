//
//  diaryViewController.swift
//  My Diary
//
//  Created by admin on 12/15/22.
//

import UIKit

protocol diaryOpreations{
    func addNewDiary(ownerId: String, title: String,content:String)
    func editDiary(id:String,ownerId:String,title:String,content:String)
    func deleteDiary(diaryId:String,userID:String)
}

class diaryViewController: UIViewController,diaryOpreations {
    

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
    var userID = String()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        getPosts(userID: userID)
        }
    
    override func viewDidAppear(_ animated: Bool) {
        checkisEmpty()
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
    
    func getPosts(userID:String){
        posts.getAllPosts(id: userID) { data, response, error in
            do{
                if let jsonResul = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray{
                   
                    for post in jsonResul {
                        let pp = post as! NSDictionary
                        self.diary.append(pp)
                    }
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
    
    func addNewDiary(ownerId: String, title: String,content:String) {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd MMM yyyy"
        posts.AddNewPost(ownerId: ownerId, title: title, created_At: dataFormatter.string(from: Date()), content: content) { data, respons, error in
            do{
                let httpResponse = respons as! HTTPURLResponse
                DispatchQueue.main.async {
                    if httpResponse.statusCode == 200 {
                        print(self.userID)
                        self.diary.removeAll()
                        self.getPosts(userID: self.userID)
                        self.dismiss(animated: true)
                        
                    }
                }
            }
        }
    }
    
    func editDiary(id: String, ownerId: String, title: String,content:String) {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd MMM yyyy"
        posts.updatePost(id:id, ownerId: ownerId, title: title, created_At: dataFormatter.string(from: Date()), content: content) { data, respons, error in
            do{
                let httpResponse = respons as! HTTPURLResponse
                DispatchQueue.main.async {
                    if httpResponse.statusCode == 200 {
                        self.diary.removeAll()
                        self.getPosts(userID: self.userID)
                        self.dismiss(animated: true)
                    }
                }
            }
        }
    }
    
    func deleteDiary(diaryId: String,userID:String) {
        posts.deletePost(id: diaryId) { data, response, error in
            DispatchQueue.main.async {
                let httpRespons = response as! HTTPURLResponse
                if httpRespons.statusCode == 200 {
                    self.diary.removeAll()
                    self.getPosts(userID: userID)
                    self.dismiss(animated: true)
                }
            }
           

        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "sideMenu")
        {
            if let controller = segue.destination as? menuViewController
            {
                controller.userEmail = userEmail
                controller.userID = userID
                controller.diaryOP = self 
                self.menuVC = controller
                self.menuVC?.menuDelegate = self
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
    
    @IBAction func addNewDiary(_ sender: UIButton){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addEditVC = storyBoard.instantiateViewController(withIdentifier: "AddEdit") as! AddEditViewController
        addEditVC.userId = userID
        addEditVC.diaryOp = self
        addEditVC.modalPresentationStyle = .fullScreen
        present(addEditVC, animated: true)
        
    }
    
    
   

}


extension diaryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        diary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "diaryCell", for: indexPath) as! diaryCell
        cell.viewCell.layer.cornerRadius = 20
        
        let data = diary[indexPath.row]
        cell.titleLable.text = "\(data["title"] as! String)"
        cell.dataLabel.text = "\(data["created_At"] as! String)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height * 0.12)

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil) 
        let addEditVC = storyBoard.instantiateViewController(withIdentifier:"AddEdit") as! AddEditViewController
        addEditVC.isEdited = true
        let data = diary[indexPath.row]
        addEditVC.diaryId = "\(data["_id"] as! String)"
        addEditVC.diaryTitle = "\(data["title"] as! String)"
        addEditVC.diaryNote = "\(data["content"] as! String)"
        addEditVC.diaryDate = "\(data["created_At"] as! String)"
        addEditVC.userId = userID
        addEditVC.diaryOp = self
        addEditVC.modalPresentationStyle = .fullScreen
        
        present(addEditVC, animated: true)
        
    }
    
}

extension diaryViewController: Menu{
    func hiddeMenu(){
        self.hiddeMenuView()
        
    }
    
}
