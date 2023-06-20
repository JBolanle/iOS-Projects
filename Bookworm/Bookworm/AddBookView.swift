//
//  AddBookView.swift
//  Bookworm
//
//  Created by Jumoke Bolanle on 6/12/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var rating = 0
    @State private var review = ""
    @State private var date = Date.now
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Memoir", "Romance", "Thriller"]
    
    var isValidBook: Bool {
        if title.isEmpty || title == "" || author.isEmpty || author == "" {
            return false
        } else {
            return true
        }
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of Book: ", text: $title)
                    TextField("Author's name: ", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a Review")
                }
                
                Section {
                    Button("Save") {
                        // add the book
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        newBook.date = Date.now
                        
                        try? moc .save()
                        dismiss()
                    } .disabled(isValidBook == false)
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
