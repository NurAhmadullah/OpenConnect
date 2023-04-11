//
//  ContactDetailView.swift
//  OpenConnect
//
//  Created by BJIT on 11/4/23.
//

import SwiftUI

struct ContactDetailView: View {
    var contact:Contact
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .leading){
                VStack(alignment: .center){
                    Text(contact.name.prefix(1))
                        .font(.system(size: geo.size.height/10))
                        .frame(width: 120,height: 120)
                        .background(Circle().fill(Color.green))
                    Text(contact.name)
                        .font(.title)
                    Text(contact.description)
                        .font(.subheadline)
                    HStack{
                        CustomButtonVeiw(screenSize: geo.size)
                        CustomButtonVeiw(screenSize: geo.size)
                        CustomButtonVeiw(screenSize: geo.size)
                        CustomButtonVeiw(screenSize: geo.size)
                        CustomButtonVeiw(screenSize: geo.size)
                    }
                }
                VStack(alignment: .leading){
                    Text(contact.phone)
                        .font(.system(size: 20))
                        .frame(width: geo.size.width - 50,alignment: .leading)
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray))
                
                
                VStack(alignment: .leading){
                    HorizontalButtonView(text: "Send Message", screenSize: geo.size)
                    HorizontalButtonView(text: "Share Contact", screenSize: geo.size)
                    HorizontalButtonView(text: "Add to Favourite", screenSize: geo.size)
                    HorizontalButtonView(text: "Add to Emergency Contacts", screenSize: geo.size)
                    HorizontalButtonView(text: "Share My Location", screenSize: geo.size)
                    HorizontalButtonView(text: "Block this Caller", screenSize: geo.size)
                }
                .padding(.top,20)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray))
                Spacer()
            }
            .padding(20)
        }
    }
}


struct CustomButtonVeiw:View{
    var screenSize:CGSize
    var body: some View{
        Button {
            print("button clicked")
        } label: {
            Image(systemName: "plus")
                .font(.system(size: screenSize.height/12))
                .frame(width: (screenSize.width - 80) / 5,height: (screenSize.width - 80) / 5)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
        }
    }
}


struct HorizontalButtonView:View{
    var text:String
    var screenSize:CGSize
    var body: some View{
        Text(text)
            .font(.system(size: 20))
            .frame(width: screenSize.width - 40,alignment: .leading)
            .padding(.leading, 10)
            .onTapGesture {
                print("hello world")
            }
        Rectangle()
            .offset(x: 10)
            .frame(width: screenSize.width - 50, height: 1)
    }
}

struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: Contact(name: "Name", description: "Job title", phone: "012345"))
    }
}
