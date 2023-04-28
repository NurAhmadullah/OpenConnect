//
//  AddContactView.swift
//  OpenConnect
//
//  Created by BJIT on 25/4/23.
//

import SwiftUI

struct AddContactView: View {
    var viewModel:ContactListViewModel
    
    @State var editContact:Contact?
    
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
                        //viewModel.addContact()
                        if editContact != nil {
                            editContact?.name = name
                            editContact?.phone = phoneNumber
                            editContact?.description = description
                        }
                        else {
                            viewModel.addContactWith(name: name, phone: phoneNumber, description: description)
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
                self.name = editContact?.name ?? ""
                self.phoneNumber = editContact?.phone ?? ""
                self.description = editContact?.description ?? ""
            }
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(viewModel: ContactListViewModel())
    }
}

