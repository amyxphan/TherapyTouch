//
//  LiveHelpManageView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/14/24.
//

import SwiftUI

struct LiveHelpManageView: View {
    @State private var appointments: [[String: String]] = []

    // Load confirmed appointments
    private func loadAppointments() {
        appointments = UserDefaults.standard.array(forKey: "confirmedAppointments") as? [[String: String]] ?? []
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("View My Appointments")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                    .padding(.bottom, 40)

                if appointments.isEmpty {
                    Text("No upcoming appointments yet.")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    Text("Upcoming Appointments:")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.leading)
                        .padding(.bottom, 10)

                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(appointments.indices, id: \.self) { index in
                            let item = appointments[index]
                            AppointmentSection(
                                therapist: item["therapist"] ?? "Therapist",
                                description: item["description"] ?? "Appointment"
                            ) {
                                appointments.remove(at: index)
                                UserDefaults.standard.set(appointments, forKey: "confirmedAppointments")
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .onAppear(perform: loadAppointments)
    }
}

struct AppointmentSection: View {
    var therapist: String
    var description: String
    var onCancel: () -> Void

    @State private var showCallAlert = false
    private let phoneNumber = "1234567890"

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 6) {
                Text(therapist)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.leading, 8)
                Text(description)
                    .font(.system(size: 18))
                    .padding(.leading, 8)
            }

            Spacer()

            VStack(spacing: 10) { // ensures even gap between Join and Cancel
                Button("Join") {
                    showCallAlert = true
                }
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color(hex: "#B89D6A"))
                .cornerRadius(5)
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

                Button("Cancel", action: onCancel)
                    .font(.system(size: 18, weight: .bold))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .foregroundColor(Color(hex: "#FF0000"))
                    .cornerRadius(5)
            }
            .padding(.trailing, 10)
        }
        .frame(maxWidth: 375)
        .padding(.vertical, 10)
        .background(Color(hex: "#F0DFBE"))
        .cornerRadius(5)
    }
}

struct LiveHelpManageView_Previews: PreviewProvider {
    static var previews: some View {
        LiveHelpManageView()
    }
}
