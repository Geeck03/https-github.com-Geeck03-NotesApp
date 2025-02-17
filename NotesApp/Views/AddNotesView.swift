//
//  AddNotesView.swift
//  NotesApp
//
//  Created by Sewell, Aramaea on 2/15/25.
//

import SwiftUI

struct AddNoteView: View {
    
    /*
     We need to have an EO to display the noteViewModel
     State: For a single View. We need to state the noteTitle
     Environment: app-wide state. Says multiple views need access to it,
     
     noteViewModel: (grabbing the noteViewModel)
     
     */
    
    //Accessing the NoteViewModel class
    @EnvironmentObject var noteViewModel: NoteViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var noteTitle : String = ""
    //@State private var fullText: String = " "
    @State private var details : String = ""
    
    @State private var isEditing: Bool = false
    @State private var errorMessage: String? = nil
    
    var noteToEdit: Note?
    
    
    
    //@Binding var isPresentingAddTaskView: Bool
    //@Binding var isPresentingEditTaskView: Bool
    
    
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Note Title")) {
                    TextField("Enter Title", text: $noteTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                }
                
                Section(header: Text("Note details")) {
                    TextEditor(text: $details)
                        .frame(height: 150)
                        .border(Color.pink, width: 1)
                }
                .onAppear {
                    if let note = noteToEdit {
                        isEditing = true
                        noteTitle = note.title
                        details = note.details
                    }
                }
                
                
                
                HStack {
                    Spacer()
                    Button(action: saveNote) {
                        Text(isEditing ? "Update Note" : "Save Note")
                            .padding()
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(color: .pink, radius: 6, x: 2, y: 2)
                    }
                
                    Spacer()
                }
                .padding()
            }
        }
    }
        
        func saveNote() {
            if isEditing {
                if let note = noteToEdit {
                    noteViewModel.updateNote(note: note, title: noteTitle, details: details)
                }
            }
            else {
                noteViewModel.addNote(title: noteTitle, details: details)
            }
            dismiss()
        }
        
        
        
        
        /*
         ReusableInputView(placeholder: "Note title", text: $noteTitle)
         .shadow(color: .purple.opacity(0.3), radius: 5, x: 2, y: 2)
         
         ReusableDetailsView(fullText: $details)
         .background(Color(.systemPink).opacity(0.2))
         .cornerRadius(16)
         .overlay(
         RoundedRectangle(cornerRadius: 16)
         .stroke(Color.purple, lineWidth: 2)
         )
         .shadow(color: .purple.opacity(0.3), radius: 5, x: 2, y: 2)
         .padding()
         */
        /*
         
         if let errorMessage = errorMessage {
         Text(errorMessage)
         .foregroundColor(.red)
         .font(.caption)
         }
         
         
         Button("Add") {
         if noteTitle.isEmpty{
         errorMessage = "Note is empty"
         } else {
         noteViewModel.addNote(title: noteTitle, details: details)
         //Turns off the file
         dismiss()
         }
         */
}


//Create input field
/*
 We are creating a reusable input view
 
 */
/*
struct ReusableInputView: View {
    let placeholder: String
    @Binding var text: String

    
    var body: some View {
        TextField(placeholder, text: $text)
            //.font(.system(size: 30))
            //.padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
    
}

struct ReusableDetailsView: View {
    @Binding var fullText: String
    
    var body: some View {
        TextEditor(text: $fullText)
            //.font(.system(size: 30))
            //.padding()
            .foregroundColor(Color.gray)
            .font(.custom("HelveticaNeue", size: 13))
    }
    
}
 */

#Preview {
    AddNoteView()
}
