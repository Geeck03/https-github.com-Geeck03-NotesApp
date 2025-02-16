//
//  ContentView.swift
//  NotesApp

//Tutorial complete
//
//  Created by Sewell, Aramaea on 2/13/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NoteListView()
                .navigationTitle("Notes")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(NoteViewModel())
}
