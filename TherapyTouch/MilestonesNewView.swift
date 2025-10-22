//
//  MilestonesNewView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/8/24.
//

import SwiftUI

struct MilestonesNewView: View {
    @Binding var milestones: [Goal]
    @Environment(\.dismiss) var dismiss
    
    @State private var goalTitle = ""
    @State private var startDate = Date()
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            Color(hex: "#FFF9EF")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Add New Goal")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.top)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Goal Name")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                    
                    TextField("Enter your goal", text: $goalTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .frame(height: 45)
                    
                    Text("Start Date")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.top, 10)
                    
                    DatePicker("", selection: $startDate, displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding(.horizontal)
                }
                .padding()
                .background(Color(hex: "#F0DFBE"))
                .cornerRadius(15)
                .shadow(radius: 4)
                .padding(.horizontal)
                
                HStack {
                    Button(action: { dismiss() }) {
                        Text("Cancel")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                    
                    Button(action: addGoal) {
                        Text("Save")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#B89D6A"))
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
            }
            .alert("Please enter a goal name", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
    
    private func addGoal() {
        let trimmed = goalTitle.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty {
            showAlert = true
        } else {
            milestones.append(Goal(title: trimmed, startDate: startDate))
            dismiss()
        }
    }
}
