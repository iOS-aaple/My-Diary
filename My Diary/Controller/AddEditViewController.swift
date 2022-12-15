//
//  AddEditViewController.swift
//  My Diary
//
//  Created by H . on 21/05/1444 AH.
//

import UIKit

class AddEditViewController: UIViewController {
    
    @IBOutlet weak var noteView : UIView!
    @IBOutlet weak var saveBtn : UIButton!
    @IBOutlet weak var titleTextField :UITextField!
    @IBOutlet weak var noteTextField :UITextField!
    @IBOutlet weak var datepicker : UIDatePicker! // ممكن نستغنى عنه
    
    // MARK: Save Action
    @IBAction func saveAction (_ sender : Any){
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
    // MARK: corners setup
        noteView.layer.cornerRadius = 40
        saveBtn.layer.cornerRadius = 40
        

        // Do any additional setup after loading the view.
    }
    



}
