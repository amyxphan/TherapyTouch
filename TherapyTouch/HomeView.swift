//
//  HomeView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/23/24.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 5) {
                    Text("Hello! [NAME]")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.top, 45)
                    Text("Here's a summary of your journey:")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 8)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Quote of the day:")
                            .font(.system(size: 18))
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: "#F0DFBE"))
                            .frame(height: 90)
                    }
                    .padding(.bottom, 8)
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
                    .padding(.bottom, 8)
                    
                    // Milestones Section
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Milestones:")
                            .font(.system(size: 18))
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: "#F0DFBE"))
                            .frame(height: 90)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
}
