
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
    var diaryTitle = String()
    var diaryDate = String()
    var diaryNote = String()
    let dataFormatter = DateFormatter()
    var diaryOp:diaryOpreations?
    
    func check(){
        print("🅱️")
        if isEdited {
            deleteDiary.isHidden = false
            print("🅾️")
        } else {
            print("❎")
            deleteDiary.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("❎ \(userId)")
    //MARK: setup views corners
        noteView.layer.cornerRadius = 40
        saveChangesBtn.layer.cornerRadius = 20
        deleteDiary.layer.cornerRadius = 20
        
        // MARK:
        dataFormatter.dateFormat = "dd MMM yyyy"
        datePicker.isHidden = true
        dateLabel.isHidden = true
        
        addTitle.text = diaryTitle
        dateLabel.text = diaryDate
        noteTextField.text = diaryNote
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        check()
    }
    
    // MARK: bbb
    func deletePost(){
        
        diaryOp?.deleteDiary(diaryId: diaryId!, userID: userId!)
    }
    
    func editPost(){
        
        diaryOp?.editDiary(id: diaryId!, ownerId: userId!, title: addTitle.text!, content: noteTextField.text!)
    }
    
    func addNewPost(){
        
        diaryOp?.addNewDiary(ownerId: userId!, title: addTitle.text!, content: noteTextField.text!)
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
        dismiss(animated: true)
    }
    
}
