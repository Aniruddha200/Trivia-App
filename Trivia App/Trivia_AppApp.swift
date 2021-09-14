//
//  Trivia_AppApp.swift
//  Trivia App
//
//  Created by administrator on 14/09/2021.
//

import SwiftUI

@main
struct Trivia_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
