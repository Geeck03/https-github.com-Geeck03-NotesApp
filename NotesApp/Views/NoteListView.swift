//
//  NoteListView.swift
//  NotesApp
//
//  Created by Sewell, Aramaea on 2/13/25.
//

import SwiftUI

struct NoteListView: View {
    
    @EnvironmentObject var noteViewModel: NoteViewModel
    @State private var isPresentingAddTaskView = false
    
    var body: some View {
        //List view takes in an array an easier notation for each in (note in)
        
        VStack{
            List(noteViewModel.notes){note in
                NoteRowView(note: note)
            }
            .listStyle(PlainListStyle())
            
            /*
             Note: This adds a new page.
             */
            Button("Add Note") {
                isPresentingAddTaskView = true
            }
            .padding()
            .sheet(isPresented: $isPresentingAddTaskView) {
                AddNoteView() //Place holder. We want the text field for the notes
            }
        }
    }
}

struct DetailView: View {
    
    var note: Note
    var body : some View {
        VStack {
            Text(note.details)
        }
    }
}

struct NoteRowView: View {
    //We are creating a reference to a note object
    var note: Note
    //Track whether circle has been clicked.
    
    
    //@State var change = false
    //Needed to change to make sure it's consistent
    @State var change = false { didSet {note.isCompleted = change}}
    
    var body : some View {
        
        VStack {
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
            
            NavigationLink(destination: DetailView(note: note)) {
                Text("Details")

            }
        }
        
    }
}


#Preview {
    NoteListView()
        .environmentObject(NoteViewModel())
}

// We need another preview
#Preview {
    //We have to intalize a class to show them.
    NoteRowView(note: Note(title: "Note 1!!! BRUH"))
}


