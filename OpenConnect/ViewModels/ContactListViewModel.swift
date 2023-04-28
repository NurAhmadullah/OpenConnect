//
//  HomeViewModel.swift
//  OpenConnect
//
//  Created by BJIT on 11/4/23.
//

import Foundation

class ContactListViewModel:ObservableObject{
    @Published var contacts:[Contact] = []
    
    func addContact(){
        contacts.append(Contact(name: "Sohag \(contacts.count + 1)", description: "Software Engineer", phone: "01878035686"))
    }
    func addContactWith(name:String,phone:String,description:String){
        contacts.append(Contact(name: name, description: description, phone: phone))
    }
    func deleteContact(at index:Int){
        contacts.remove(at: index)
    }
    func deleteContactIndexSet(at indexSet:IndexSet){
        contacts.remove(atOffsets: indexSet)
    }
}
