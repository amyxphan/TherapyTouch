//
//  ContentView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/21/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(hex: "#B89D6A")
                .edgesIgnoringSafeArea(.all)
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                ProductivityView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Productivity")
                    }
                FocusView()
                    .tabItem {
                        Image(systemName: "timer")
                        Text("Focus")
                    }
                LiveHelpView()
                    .tabItem {
                        Image(systemName: "phone")
                        Text("Live Help")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255
        let green = Double((rgb >> 8) & 0xFF) / 255
        let blue = Double(rgb & 0xFF) / 255

        self.init(red: red, green: green, blue: blue)
    }
}
