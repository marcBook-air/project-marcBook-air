//
//  HumorlyApp.swift
//  Humorly
//
//  Created by Marc Vlasblom on 19/12/2021.
//

import SwiftUI

@main
struct HumorlyApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
