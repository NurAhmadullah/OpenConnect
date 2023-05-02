//
//  ContentView.swift
//  OpenConnect
//
//  Created by Sohag Macbook Pro on 7/4/23.
//




import SwiftUI
import CoreData


struct ContentView: View {
    /*
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    */
    @EnvironmentObject var viewModel : ContactListViewModel
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.contacts,id:\.name){ contact in
                    NavigationLink(destination: ContactDetailView(contact: contact)){
                        ContactRowView(contact: contact)
                    }
                }
                .onDelete(perform: viewModel.deleteContactIndexSet)
            }
            .navigationBarTitle(Text("Open Connect"))
            .navigationBarItems(trailing:
                                    NavigationLink {
                AddContactView()
            } label: {
                Image(systemName: "plus")
            }
            )
            .navigationBarItems(trailing:
                                    Button(action: {
                if viewModel.contacts.count > 0{
                    viewModel.deleteContact(at: viewModel.contacts.count-1)
                }
            }, label: {
                Image(systemName: "minus")
            })
            )
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
        ContentView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(ContactListViewModel())
    }
}

