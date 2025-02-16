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
    @State private var errorMessage: String? = nil
    
    
    
    //@Binding var isPresentingAddTaskView: Bool
    //@Binding var isPresentingEditTaskView: Bool
    
    
    
    var body: some View {
        VStack {
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

#Preview {
    AddNoteView(isPresentingAddTaskView: .constant(false), isPresentingEditTaskView: .constant(true))
}
