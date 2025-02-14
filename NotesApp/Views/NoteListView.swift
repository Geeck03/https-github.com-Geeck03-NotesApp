//
//  NoteListView.swift
//  NotesApp
//
//  Created by Sewell, Aramaea on 2/13/25.
//

import SwiftUI

struct NoteListView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
    
    }
}

struct NoteRowView: View {
    //We are creating a reference to a note object
    var note: Note
    
    //Track whether circle has been clicked.
    @State var change = false
    
    var body: some View {
        
        //We are using the list view
        
        //Working here. 20 minutes into tutorial. Working on the list section
        
        HStack {
            Text(note.title)
                //if change is = true then strikethrough occurs
                .strikethrough(change, color: .gray)
            Spacer()
            Image(systemName: change ? "checkmark.circle.fill" : "circle")
                .foregroundColor(change ? .green : .gray)
                .onTapGesture {
                    change.toggle()
                    print(change)
                }
        }
        .padding(20)
        
    
    }
}

#Preview {
    NoteListView()
}

// We need another preview
#Preview {
    //We have to intalize a class to show them.
    NoteRowView(note: Note(title: "Note 1!!! BRUH"))
}


