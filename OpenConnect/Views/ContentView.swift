//
//  ContentView.swift
//  OpenConnect
//
//  Created by Sohag Macbook Pro on 7/4/23.
//

import SwiftUI
import CoreData

var contacts = [
    Contact(name: "Sohag", description: "iOS developer", phone: "0123456789"),
    Contact(name: "Zahid", description: "iOS developer", phone: "0123456789"),
    Contact(name: "Dev3", description: "android developer", phone: "0123456789"),
    Contact(name: "Dev4", description: "PHP developer", phone: "0123456789"),
    Contact(name: "Dev5", description: "java developer", phone: "0123456789"),
]

struct ContentView: View {
    /*
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    */
    var body: some View {
        NavigationView {
            List(contacts,id:\.name){ contact in
                NavigationLink(destination: ContactDetailView(contact: contact)){
                    ContactView(contact: contact)
                }
            }
            .navigationBarTitle(Text("Contacts"))
        }
    }

    /*
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    */
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
