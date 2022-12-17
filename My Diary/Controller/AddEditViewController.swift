//
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
    
    @IBOutlet weak var backBtn: UIButton!
    
    
    // MARK: Vars
    var isEdited = false
    
    
    func check(){
        if isEdited == false {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //MARK: setup views corners
        noteView.layer.cornerRadius = 40
        saveChangesBtn.layer.cornerRadius = 20
        deleteDiary.layer.cornerRadius = 20
        
    }
    
    
    // MARK: save Changes Functionality
    @IBAction func saveBtnAction(_ sender: Any) {
        
    }
    
    // MARK: delete Button Action
    
    @IBAction func deleteDiaryAction(_ sender: Any) {
    }
    
    // MARK: back Changes Functionality 
    @IBAction func backBtnAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginView = storyBoard.instantiateViewController(withIdentifier: "homeDiary")
        loginView.modalPresentationStyle = .fullScreen
        present(loginView, animated: true)
    }
    
}
