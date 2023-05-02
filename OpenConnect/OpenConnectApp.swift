//
//  OpenConnectApp.swift
//  OpenConnect
//
//  Created by Sohag Macbook Pro on 7/4/23.
//

import SwiftUI

@main
struct OpenConnectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(ContactListViewModel())
        }
    }
}
