//
//  ContactModel.swift
//  OpenConnect
//
//  Created by BJIT on 11/4/23.
//

import Foundation

class Contact:ObservableObject{
    @Published var name:String
    @Published var description:String
    @Published var phone:String
    init(name: String, description: String, phone: String) {
        self.name = name
        self.description = description
        self.phone = phone
    }
}
