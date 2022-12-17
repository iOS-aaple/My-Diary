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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //MARK: setup views corners
        noteView.layer.cornerRadius = 40
        saveChangesBtn.layer.cornerRadius = 20

       
    }
    
    // MARK: save Changes Functionality
    @IBAction func saveBtnAction(_ sender: Any) {
    }
    
    // MARK: edit Changes Functionality 
    @IBAction func editBtnAction(_ sender: Any) {
    }
    
}
