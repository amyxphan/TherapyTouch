//
//  TherapyTouchApp.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/21/24.
//

import SwiftUI
import Firebase

@main
struct TherapyTouchApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
