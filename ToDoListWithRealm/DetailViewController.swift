//
//  DetailViewController.swift
//  ToDoListWithRealm
//
//  Created by Metehan Karadeniz on 15.07.2023.
//

import UIKit
import RealmSwift

class DetailViewController : UIViewController {
    weak var delegate: NoteUpdateDelegate?
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var noteDescriptionTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func saveButtonClicked(_sender: UIButton) {
        RealmManager.shared.saveStudent(title: noteTextField.text!, description: noteDescriptionTextField.text!, date: dateTextField.text!)
       
    }
    @IBAction func dismissButtonClicked(_sender: UIButton) {
        // Dismiss işlemi gerçekleştiğinde
        performSegue(withIdentifier: "dismiss", sender: self)
          delegate?.updateNotes()
          
    }
    
   
}
