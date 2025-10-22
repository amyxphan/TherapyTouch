//
//  LiveHelpManageView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/14/24.
//

import SwiftUI

struct LiveHelpManageView: View {
    var therapist: String = "Jane Doe"
    var description: String = "Appointment at 8:00AM"
    
    // Controls visibility for each section
    @State private var showToday = true
    @State private var showTomorrow = true
    @State private var showNextWeek = true

    var body: some View {
        ScrollView {
            Text("View my appointments")
                .font(.system(size: 28, weight: .bold))
                .padding(.top, 45)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 15) {
                if showToday {
                    AppointmentSection(
                        title: "Today:",
                        therapist: therapist,
                        description: description,
                        onCancel: { showToday = false }
                    )
                }
                
                if showTomorrow {
                    AppointmentSection(
                        title: "Tomorrow:",
                        therapist: therapist,
                        description: description,
                        onCancel: { showTomorrow = false }
                    )
                }
                
                if showNextWeek {
                    AppointmentSection(
                        title: "Next Week:",
                        therapist: therapist,
                        description: description,
                        onCancel: { showNextWeek = false }
                    )
                }
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - Reusable Appointment Section
struct AppointmentSection: View {
    var title: String
    var therapist: String
    var description: String
    var onCancel: () -> Void
    
    @State private var showCallAlert = false
    
    // Toggle this to switch between behavior
    private let useConfirmationPopup = true
    private let phoneNumber = "1234567890" // Replace with your therapist's phone number

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18))
                .padding(.leading, 5)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(therapist)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.leading, 8)
                        .padding(.bottom, 2)
                        .foregroundColor(.black)
                    Text(description)
                        .font(.system(size: 18))
                        .padding(.leading, 8)
                        .padding(.bottom, 2)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                VStack {
                    // JOIN BUTTON
                    Button(action: {
                        if useConfirmationPopup {
                            // Show alert first
                            showCallAlert = true
                        } else {
                            // Directly open phone app
                            if let phoneURL = URL(string: "tel://\(phoneNumber)") {
                                UIApplication.shared.open(phoneURL)
                            }
                        }
                    }, label: {
                        Text("Join")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color(hex: "#B89D6A"))
                            .cornerRadius(5)
                    })
                    .padding(.top, 10)
                    // Show confirmation popup if enabled
                    .alert("Call your therapist?", isPresented: $showCallAlert) {
                        Button("Cancel", role: .cancel) {}
                        Button("Call") {
                            if let phoneURL = URL(string: "tel://\(phoneNumber)") {
                                UIApplication.shared.open(phoneURL)
                            }
                        }
                    } message: {
                        Text("Would you like to open your phone app to call your therapist?")
                    }
                    
                    // CANCEL BUTTON
                    Button(action: onCancel, label: {
                        Text("Cancel")
                            .font(.system(size: 18, weight: .bold))
                            .padding(8)
                            .foregroundColor(Color(hex: "#FF0000"))
                            .cornerRadius(5)
                    })
                    .padding(.bottom, 8)
                }
                .frame(maxHeight: 120)
                .padding(.trailing, 10)
            }
            .frame(maxWidth: 375, alignment: .leading)
            .background(Color(hex: "#F0DFBE"))
            .cornerRadius(5)
            .padding(.bottom, 5)
        }
    }
}

struct LiveHelpManageView_Previews: PreviewProvider {
    static var previews: some View {
        LiveHelpManageView()
    }
}
