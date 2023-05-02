//
//  ContactView.swift
//  OpenConnect
//
//  Created by BJIT on 11/4/23.
//

import SwiftUI

struct ContactRowView: View {
    @ObservedObject var contact:Contact
    var body: some View {
        VStack(alignment: .leading){
            Text(contact.name).font(.title)
            HStack{
                Text(contact.description).font(.subheadline)
                Spacer()
                Text(contact.phone).font(.subheadline)
            }
        }
    }
}
