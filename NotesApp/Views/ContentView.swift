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
                .shadow(color: .pink, radius: 6, x: 2, y: 2)

        }
    }
}

#Preview {
    ContentView()
        .environmentObject(NoteViewModel())
}
