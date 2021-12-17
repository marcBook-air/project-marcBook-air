//
//  HumorlyProjectApp.swift
//  HumorlyProject
//
//  Created by Marc Vlasblom on 15/12/2021.
//

import SwiftUI

@main
struct HumorlyProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            iCloudConnect()
//            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
