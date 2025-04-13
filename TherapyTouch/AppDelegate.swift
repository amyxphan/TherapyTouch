//
//  AppDelegate.swift
//  TherapyTouch
//
//  Created by Amy Phan on 4/13/25.
//

import SwiftUI
import Firebase

@main
struct MyApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
