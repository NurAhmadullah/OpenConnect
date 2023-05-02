//
//  HomeViewModel.swift
//  OpenConnect
//
//  Created by BJIT on 11/4/23.
//

import Foundation

class ContactListViewModel:ObservableObject{
    @Published var contacts:[Contact] = []
    
    func addContactWith(name:String,phone:String,description:String,id:String){
        contacts.append(Contact(name: name, description: description, phone: phone, id: id))
    }
    func updateContact(contactId:String,name:String,phone:String,description:String){
        let editContact = contacts.first(where: {$0.id == contactId})
        editContact?.name = name
        editContact?.phone = phone
        editContact?.description = description
    }
    func deleteContact(at index:Int){
        contacts.remove(at: index)
    }
    func addDemoContact(){
        contacts.append(Contact(name: "Sohag \(contacts.count + 1)", description: "Software Engineer", phone: "01878035686", id: "123"))
    }
    func deleteContactIndexSet(at indexSet:IndexSet){
        contacts.remove(atOffsets: indexSet)
    }
}
