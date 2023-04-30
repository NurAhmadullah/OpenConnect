//
//  ContactModel.swift
//  OpenConnect
//
//  Created by BJIT on 11/4/23.
//

import Foundation

class Contact:ObservableObject{
    var id:String
    @Published var name:String
    @Published var phone:String
    @Published var description:String

    init(name: String, description: String, phone: String, id:String) {
        self.name = name
        self.description = description
        self.phone = phone
        self.id = id
    }
}
