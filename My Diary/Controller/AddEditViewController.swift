
//  AddEditViewController.swift
//  My Diary
//
//  Created by H . on 23/05/1444 AH.
//

import UIKit

class AddEditViewController: UIViewController {
    
    // MARK: outlets
    @IBOutlet weak var noteTextField: UITextField! // note content text field
    
    @IBOutlet weak var addTitle: UITextField! // title textfield
    
    @IBOutlet weak var datePicker: UIDatePicker! // هذي اللي ممكن نستغني عنها
    
    @IBOutlet weak var saveChangesBtn: UIButton! // just to modify
    
    @IBOutlet weak var noteView: UIView! // the pink view
    
    @IBOutlet weak var editbutton: UIButton! // content edit
    
    @IBOutlet weak var deleteDiary: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    
    // MARK: Vars
    var isEdited = false
    var diaryId:String?
    var userId: String?
    
    let dataFormatter = DateFormatter()
    
    
    func check(){
        if isEdited {
            deleteDiary.isHidden = false
            
        } else {
            deleteDiary.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //MARK: setup views corners
        noteView.layer.cornerRadius = 40
        saveChangesBtn.layer.cornerRadius = 20
        deleteDiary.layer.cornerRadius = 20
        
        // MARK:
        dataFormatter.dateFormat = "dd MMM yyyy"
        datePicker.isHidden = true
        dateLabel.isHidden = true
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        check()
    }
    
    // MARK: bbb
    func deletePost(){
        
        posts.deletePost(id: diaryId!) { data, response, error in
            let httpRespons = response as! HTTPURLResponse
            
            print(httpRespons.statusCode)
        }
    }
    
    func editPost(){
        
        posts.updatePost(id: diaryId!, ownerId: userId!, title: addTitle.text!, created_At: dataFormatter.string(from: Date()), content: noteTextField.text!) { data, respons, error in
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
        
        posts.AddNewPost(ownerId: "111", title: addTitle.text!, created_At: dataFormatter.string(from: Date()), content: noteTextField.text!) { data, respons, error in
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
    
    // MARK: save Changes Functionality
    @IBAction func saveBtnAction(_ sender: Any) {
        if isEdited{
            editPost()
            isEdited = false
        } else{
            addNewPost()
        }
    }
    
    // MARK: delete Button Action
    
    @IBAction func deleteDiaryAction(_ sender: Any) {
        deletePost()
    }
    
    // MARK: back Changes Functionality
    @IBAction func backBtnAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginView = storyBoard.instantiateViewController(withIdentifier: "homeDiary")
        loginView.modalPresentationStyle = .fullScreen
        present(loginView, animated: true)
    }
    
}
