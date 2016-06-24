//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import RealmSwift

class DisplayNoteViewController: UIViewController {
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    
    var note: Note?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let note = note {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            let listNotesViewController = segue.destinationViewController as! ListNotesTableViewController
            if identifier == "Cancel" {
                
            } else if identifier == "Save" {
                if let note = note {
                    let newNote = Note()
                    newNote.title = noteTitleTextField.text  ?? ""
                    newNote.content = noteContentTextView.text ?? ""
                    RealmHelper.updateNote(note, newNote: newNote)
                } else {
                    let note = Note()
                    note.title = noteTitleTextField.text ?? ""
                    note.content = noteContentTextView.text ?? ""
                    note.modificationDate = NSDate()
                    RealmHelper.addNote(note)
                }
            }
            listNotesViewController.notes = RealmHelper.retrieveNotes()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    } 

}
