//
//  RealmHelper.swift
//  MakeSchoolNotes
//
//  Created by Luca Hagel on 6/21/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    static func addNote(note: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(note)
        }
    }
    
    static func removeNote(note: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(note)
        }
    }
    
    static func updateNote(noteToBeUpdated: Note, newNote: Note) {
        let realm = try! Realm()
        try! realm.write() {
            noteToBeUpdated.title = newNote.title
            noteToBeUpdated.content = newNote.content
            noteToBeUpdated.modificationDate = newNote.modificationDate
        }
    }
    
    static func retrieveNotes() -> (Results<Note>) {
        let realm = try! Realm()
        let notes = realm.objects(Note).sorted("modificationDate", ascending: false)
        return notes
    }
}
