//
//  NoteViewModel.swift
//  NotesApp
//
//  Created by Sewell, Aramaea on 2/13/25.
//

import Foundation

/*
 
 What is the View Model for? Handels UI log and binds data.
 We are using an ObservableObject to hold an array of notes
 
 
 
 */
class NotViewModel: ObservableObject {
    
    //We want to start with an empty array.
    @Published var notes: [Note] = []
    
    
    /* When task is being created.
     So as long as task is empty,
     
     */
    
    
    //Creates a new not if not empty??
    func addNote(title: String) {
        //Makes sure the title is not empty.
        guard !title.isEmpty else { return }
        
        let newNote = Note(title: title)
        notes.append(newNote)
        
        
    }
    
    
}
