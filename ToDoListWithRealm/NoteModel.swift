//
//  NoteModel.swift
//  ToDoListWithRealm
//
//  Created by Metehan Karadeniz on 15.07.2023.
//

import Foundation
import RealmSwift

class Note: Object {
    @Persisted var title: String
    @Persisted var noteDescription: String
    @Persisted var date: Date
}
