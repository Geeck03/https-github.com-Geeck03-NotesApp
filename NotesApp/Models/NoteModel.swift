//
//  NoteModel.swift
//  NotesApp
//
//  Created by Sewell, Aramaea on 2/13/25.
//


//Basic library for swift
import Foundation


//We are using classes, becauase they are mutable
/*
 Remember: The model in the MVVM is used for data and logic:
 
 What are we doing here? This model represnts each of the individual notes. By having the Identifiable class we are allowed to create an object "note" that is uniquely identifiable.
 We need this class to store the notes in an array.
 
 Models are simple.
 
 */

//Class has an ID is a constant.
class Note: Identifiable {
    
    //Assigns a unique identifer to each instance of the class. Generates a random unique value
    let id = UUID()
    //Text user can change
    var title: String
    //Tracks completion Status 
    var isCompleted: Bool
    
    //This intializes the NoteOBject with this information.
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
