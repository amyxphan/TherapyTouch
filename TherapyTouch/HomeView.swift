//
//  HomeView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/23/24.
//

import SwiftUI

struct HomeView: View {
    @State private var currentQuote = QuoteGenerator().getRandomQuote()
    @State private var milestones: [Goal] = [
        Goal(title: "Sobriety", startDate: Date().addingTimeInterval(-86400 * 100))
    ]
    @State private var showAddGoalSheet = false
    @State private var recentActivities: [Activity] = []

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 5) {
                    
                    // Header
                    ZStack(alignment: .bottomTrailing) {
                        Text("Hello Amy")
                            .font(.system(size: 28, weight: .bold))
                            .padding(.top, 10)
                            .padding()
                        
                        Image("TTLogo1")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .padding(.bottom, -20)
                            .padding(.trailing, -35)
                    }
                    
                    Text("Here's a summary of your journey:")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 8)
                    
                    // Quote of the Day
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Quote of the day:")
                            .font(.system(size: 18))
                        Button(action: {
                            currentQuote = QuoteGenerator().getRandomQuote()
                        }) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hex: "#F0DFBE"))
                                .frame(maxWidth: .infinity, minHeight: 120)
                                .overlay(
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("\"\(currentQuote.text)\"")
                                            .font(.system(size: 18))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                        Text("- \(currentQuote.author)")
                                            .font(.system(size: 15, weight: .bold))
                                            .multilineTextAlignment(.trailing)
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    // Recent Activity
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Recent Activity:")
                            .font(.system(size: 18))
                        
                        ForEach(recentActivities) { activity in
                            HomeRecentActivity(
                                category: activity.category,
                                data: activity.data,
                                submissionTime: activity.submissionTime
                            )
                            .frame(height: 90)
                        }
                    }
                    .padding(.bottom, 8)
                    
                    // Milestones Section
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Milestones:")
                                .font(.system(size: 18))
                            
                            Spacer()
                            
                            Button(action: { showAddGoalSheet = true }) {
                                Text("+")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(Color(hex: "#B89D6A"))
                            }
                        }
                        
                        ForEach(milestones) { milestone in
                            let days = daysSince(startDate: milestone.startDate)
                            HomeMilestonesCard(category: milestone.title, data: "\(days) days")
                                .frame(height: 90)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .sheet(isPresented: $showAddGoalSheet) {
                MilestonesNewView(milestones: $milestones)
            }
            .onAppear {
                recentActivities = [Activity].loadRecentActivities()
            }
        }
    }
}

// Helper function to calculate days since a date
func daysSince(startDate: Date) -> Int {
    let calendar = Calendar.current
    let start = calendar.startOfDay(for: startDate)
    let now = calendar.startOfDay(for: Date())
    let components = calendar.dateComponents([.day], from: start, to: now)
    return components.day ?? 0
}

// Goal model
struct Goal: Identifiable {
    let id = UUID()
    let title: String
    let startDate: Date
}

#Preview {
    HomeView()
}
