//
//  insta_cloneApp.swift
//  insta-clone
//
//  Created by root on 4/3/21.
//

import SwiftUI

@main
struct insta_cloneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
