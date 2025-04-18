//
//  NoteListView.swift
//
//Working on NAV
//
//  Created by Sewell, Aramaea on 2/13/25.
//

import SwiftUI

struct NoteListView: View {
    
    @EnvironmentObject var noteViewModel: NoteViewModel
    @State private var isPresentingAddTaskView: Bool = false
    
    
    
    var body: some View {
        //List view takes in an array an easier notation for each in (note in)
        
        VStack{
            List {
                ForEach(noteViewModel.notes)  { note in
                    NoteRowView(note: note)
                    
                }.onDelete {indexSet in
                    noteViewModel.notes.remove(atOffsets: indexSet)}
            }
            
            HStack {
                //Note: This adds a new page.
                
                Button("Add Note") {
                    isPresentingAddTaskView = true
                }
                .padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(color: .pink, radius: 5, x: 2, y: 2)
                .sheet(isPresented: $isPresentingAddTaskView) {
                    AddNoteView() //Place holder. We want the text field for the notes
                }
            }
        }
    }
}

//The view that is displated when the arrow is pressed
struct DetailView: View {
    //@Binding var isPresentingEditTaskView: Bool
    @EnvironmentObject var noteViewModel: NoteViewModel
    @State var isPresentingEditTaskView: Bool = false
    @State var change = false
    //Needed to change to make sure it's consistent

    //@State var change = false
    
    //{ mutating didSet {note.isCompleted = change}}
    
    var note: Note
    var body : some View {
        VStack {
            HStack {
                Text("Note Details")
                    .font(.largeTitle)
                    .padding()
                Button("Edit Note") {
                    isPresentingEditTaskView = true
                }
                .padding(7)
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(4)
                .padding()
                .sheet(isPresented: $isPresentingEditTaskView) {
                    AddNoteView(noteToEdit: note) //Place holder. We want the text field for the notes
                }
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(4)
            Text(note.title)
                .strikethrough(note.isCompleted, color: .red)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(5)
        Text(note.details)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 18))
        //.frame(maxWidth: .infinity, alignment: .leading)
        
        Spacer()
        
        Button(action : {
            noteViewModel.toggleCompletion(note: note)
        }) {
            Text(note.isCompleted ? "Completed" : "Are you done?")
                .padding(8)
                .background(note.isCompleted ? Color.green : Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        
    }
}
    


        

struct NoteRowView: View {
    //We are creating a reference to a note object
    var note: Note
    //Track whether circle has been clicked.
    //@Binding var isPresentingEditTaskView: Bool
    
    
    
    
    var body : some View {
        
        VStack {
            HStack {
                Text(note.title)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
            
            NavigationLink(destination: DetailView(note: note)) {
                Text(note.details)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(0)
            .shadow(color: .pink, radius: 5, x: 2, y: 2)
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
    //NoteRowView(note: Note(title: "Still in works"))
    NoteRowView(note: Note(title: "PRACITCE", details: "Cats!"))
        //.environmentObject(NoteViewModel())
}


