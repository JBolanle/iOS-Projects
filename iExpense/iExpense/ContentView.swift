//
//  ContentView.swift
//  iExpense
//
//  Created by Jumoke Bolanle on 4/13/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpenses = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(expenses.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .foregroundColor(item.amount >= 100 ? .orange : item.amount < 10 ? .blue : .purple)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
//                Section(header: Text("Business")) {
//                    ForEach(expenses.items) { item in
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text(item.name)
//                                    .font(.headline)
//                                Text(item.type)
//                            }
//
//                            Spacer()
//                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                                .foregroundColor(item.amount >= 100 ? .orange : item.amount < 10 ? .blue : .purple)
//                        }
//                    }
//                    .onDelete(perform: removeItems)
//                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpenses = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpenses) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

