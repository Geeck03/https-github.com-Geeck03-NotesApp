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
    @State private var errorMessage: String? = nil
    
    
    
    var body: some View {
        VStack {
            Text("Enter Note")
                .font(.headline)
            ReusableInputView(placeholder: "Note title", text: $noteTitle)
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button("Add") {
                if noteTitle.isEmpty{
                    errorMessage = "Note is empty"
                } else {
                    noteViewModel.addNote(title: noteTitle)
                    //Turns off the file 
                    dismiss()
                }
                
            }
        }
    }
}

//Create input field
/*
 We are creating a reusable input view
 
 */
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


#Preview {
    AddNoteView()
}
