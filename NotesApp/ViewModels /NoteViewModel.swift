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
class NoteViewModel: ObservableObject {
    
    //changed it from nil and data. It is now a new instance of a Note structure
    private var notesData: Note? = nil
    //We want to start with an empty array. This access the array from the NotesAppApp
    
    
    @Published var notes: [Note] = [] {
        didSet {
            //idk what to put here in the thingy
            saveNotes(Note)
        }
    }
    
    
    //This holds the JSON encoded data. Setting it = nil? Private keeps it being modified from outside the same class
    
    
    /* When task is being created.
     So as long as task is empty,
     
     */
    
    init() {
        loadNotes()
    }
    
    
    //Creates a new not if not empty?? Will append a new note if Title is not empty.
    func addNote(title: String, detail : String) {
        //Makes sure the title is not empty.
        
        let newNote = Note()
        //guard !title.isEmpty else { return }
        //let newNote = Note(title: title, detail: detail)
        notes.append(newNote)
        
    }
    
    func updateNote(note: Note, title: String, details: String) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].title = title
            notes[index].details = details
        }
    }
    
    func toggleCompletion(note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id })  {
            if notes[index].isCompleted == false {
                notes[index].isCompleted = true
            }
            else if notes[index].isCompleted == true {
                notes[index].isCompleted = false
            }
        }
        
    }
    //need ti check
    func deleteNotes(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
    
    func saveNotes(_ notesData: Note) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(notesData)
            
            //This is accessing the file path for saving
            let url = FileManager.default.urls(for: .documentDirectory, in:
                    .userDomainMask).first!.appendingPathComponent("notesData.json")
            try data.write(to: url)
            self.notesData = notesData
        }
        catch {
            print("error saving")
        }
    }
    
    func loadNotes() {
        do {
            
            //this access the file path for loading
            let url = FileManager.default.urls(for: .documentDirectory, in:
                    .userDomainMask).first!.appendingPathComponent("notesData.json")
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            let notesData = try decoder.decode(Note.self, from: data)
            self.notesData = notesData
        }
        
        catch {
            print("Error Loading profile \(error.localizedDescription)")
        }
    }
}
