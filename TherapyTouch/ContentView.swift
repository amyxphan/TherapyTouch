//
//  ContentView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/21/24.
//

import SwiftUI

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

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text("Hello! [NAME]")
                .font(.system(size: 28, weight: .bold))
            Text("Here's a summary of your journey:")
                .font(.system(size: 20, weight: .bold))
        }
        .padding(.bottom, 15)
        .edgesIgnoringSafeArea(.top)
        VStack(spacing: 8) { // Adjust the spacing between each HStack
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Quote of the day:")
                        .font(.system(size: 18))
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: "#F0DFBE"))
                        .frame(height: 90)
                }
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Recent Activity:")
                        .font(.system(size: 18))
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: "#F0DFBE"))
                        .frame(height: 90)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: "#F0DFBE"))
                        .frame(height: 90)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: "#F0DFBE"))
                        .frame(height: 90)
                }
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Milestones:")
                        .font(.system(size: 18))
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: "#F0DFBE"))
                        .frame(height: 90)
                }
            }
        }
        .padding(.horizontal)
    }
    
}

#Preview {
    ContentView()
}
