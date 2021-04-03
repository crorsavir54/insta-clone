//
//  insta_cloneApp.swift
//  insta-clone
//
//  Created by root on 4/3/21.
//

import SwiftUI
import Firebase

@main
struct insta_cloneApp: App {
    let persistenceController = PersistenceController.shared
    init() {
        FirebaseApp.configure()
      }
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
