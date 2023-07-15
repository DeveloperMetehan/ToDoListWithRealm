//
//  ViewController.swift
//  ToDoListWithRealm
//
//  Created by Metehan Karadeniz on 15.07.2023.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    private var notesArray = [Note]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
            navigationItem.rightBarButtonItem = addButton
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        
        if let results = RealmManager.shared.fetchStudents() {
            notesArray = Array(results)
            tableView.reloadData()
        }

    }
    
    @objc func addButtonTapped() {
       performSegue(withIdentifier: "goToDetailVC", sender: self)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailVC" {
            if let vc = segue.destination as? DetailViewController {
                vc.delegate = self
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return notesArray.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
           cell.textLabel?.text = notesArray[indexPath.row].title
           cell.textLabel?.textColor = .black
           
           return cell
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           performSegue(withIdentifier: "showNoteSegue", sender: self)
       }
}
extension ViewController: NoteUpdateDelegate {
    func updateNotes() {
        tableView.reloadData()
    }
    
    
}
