//
//  ProductivityView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/23/24.
//

import SwiftUI

struct ProductivityView: View {
    @State private var goals: [CustomGoal] = []
    @State private var showAddGoalModal = false
    @State private var newGoalName = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    // Header
                    ZStack(alignment: .bottomTrailing) {
                        Text("Productivity")
                            .font(.system(size: 28, weight: .bold))
                            .padding(.top, 40)
                            .padding()
                        
                        Image("TTLogo1")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .padding(.bottom, -20)
                            .padding(.trailing, -35)
                    }
                    
                    // Default productivity cards
                    ProductivityCard(title: "Hydration")
                    ProductivityCard(title: "Mood")
                    ProductivityCard(title: "Sleep")
                    ProductivityCard(title: "Workout")
                    ProductivityCard(title: "No Spend")
                    ProductivityCard(title: "Steps")
                    
                    // Dynamically added user goals
                    ForEach(goals) { goal in
                        NavigationLink(destination: CustomGoalTemplateView(goal: goal)) {
                            Text(goal.name)
                                .frame(maxWidth: 325)
                                .padding(.vertical, 18)
                                .padding(.horizontal)
                                .foregroundColor(.black)
                                .background(Color(hex: "#F0DFBE"))
                                .cornerRadius(5)
                                .buttonBorderShape(.roundedRectangle)
                        }
                        .padding(.bottom, 5)
                    }
                }
                .padding(.bottom, 30)
            }
            .sheet(isPresented: $showAddGoalModal) {
                AddGoalModal(
                    showModal: $showAddGoalModal,
                    newGoalName: $newGoalName,
                    goals: $goals
                )
            }
        }
    }
}

// Reusable card
struct ProductivityCard: View {
    let title: String
    var body: some View {
        Button(action: {}) {
            Text(title)
                .frame(maxWidth: 325)
                .padding(.vertical, 18)
                .padding(.horizontal)
                .foregroundColor(.black)
                .background(Color(hex: "#F0DFBE"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 5)
        }
    }
}

#Preview {
    ProductivityView()
}
