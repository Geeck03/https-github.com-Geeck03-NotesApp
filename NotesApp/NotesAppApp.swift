/*
 
 
 We declare the code here, because we want there to be only one instance of the array initalizing in the code.
 
 
 
 
 */


import SwiftUI

@main
struct NotesAppApp: App {
    //Creates a single instance of he ViewModel to be updated.
    @StateObject private var noteViewModel = NoteViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                //Tells SwiftUI I want this model avaliable to all views 
                .environmentObject(noteViewModel)
        }
    }
}
