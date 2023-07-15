//
//  RealmManager.swift
//  ToDoListWithRealm
//
//  Created by Metehan Karadeniz on 15.07.2023.
//

import Foundation
import RealmSwift

class RealmManager{
    
    static let shared = RealmManager()
    
    private init(){}
    // save datas to Realm Database
    func saveStudent(title:String,description: String,date:String) {
        do {
            let realm = try Realm()
            
            let note = Note()
            if title != "" {
                
                    note.title = title
                
            }
            if date != "" {
                
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/yyyy" // Eğer metin değeri bu formatta ise
                    
                    if let date = dateFormatter.date(from: date) {
                        note.date = date
                    } else {
                        // Geçersiz tarih formatı için hata işleme yapabilirsiniz
                    }

            }
            if description != "" {
                
                    note.noteDescription = description
                
            }
           
            try realm.write {
                realm.add(note)
                print("kaydedildi.")
            }
        }catch{
            print("Hata oluştu: \(error.localizedDescription)")
        }
       
    }
    
    // get datas from Realm Database
    func fetchStudents() -> Results<Note>? {
        let realm = try! Realm()
        let students = realm.objects(Note.self)
        
        return students
    }
}
