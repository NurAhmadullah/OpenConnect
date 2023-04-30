//
//  AddContactView.swift
//  OpenConnect
//
//  Created by BJIT on 25/4/23.
//

import SwiftUI

struct AddContactView: View {
    @EnvironmentObject var viewModel:ContactListViewModel
    
    var contactId:String?
    
    @Environment(\.dismiss) private var dismiss
    @State var name:String = ""
    @State var phoneNumber:String = ""
    @State var description:String = ""
    
    
    
    var body: some View {
        Color.gray
            .overlay(content: {
                VStack{
                    TextField("Enter your Name", text: $name)
                        .background(Color.white)
                    Spacer()
                        .frame(height: 10)
                    TextField("Enter phone number",text: $phoneNumber)
                        .background(Color.white)
                    Spacer()
                        .frame(height: 10)
                    TextField("Description",text: $description)
                        .background(Color.white)
                    Spacer()
                        .frame(height: 50)
                    Button {

                        if let contactId = contactId, let editContact = viewModel.contacts.first(where: {$0.id == contactId}) {
                            editContact.name = name
                            editContact.phone = phoneNumber
                            editContact.description = description
                        }
                        else {
                            viewModel.addContactWith(name: name, phone: phoneNumber, description: description, id: UUID().uuidString)
                        }
                        dismiss()
                        
                    } label: {
                        Text("Save Contact")
                    }
                    Spacer()
                }
                .padding(20)
            })
            .onAppear {
                if let contactId = contactId, let editContact = viewModel.contacts.first(where: {$0.id == contactId}) {
                    self.name = editContact.name
                    self.phoneNumber = editContact.phone
                    self.description = editContact.description
                }
            }
    }
}

//struct AddContactView_Previews: PreviewProvider {
//    @State var demoContact = Contact(name: "", description: "", phone: "")
//    static var previews: some View {
//        AddContactView(viewModel: ContactListViewModel())
//    }
//}

