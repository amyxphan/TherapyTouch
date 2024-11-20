//
//  LiveHelpView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/23/24.
//
import SwiftUI

struct LiveHelpView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        ZStack(alignment: .bottomTrailing) {
                            Text("Let's Talk!")
                                .font(.system(size: 28, weight: .bold))
                                .padding(.top, 25)
                                .padding(.bottom, 15)
                                .padding(.trailing, 125)
                            Image("TTLogo1")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .padding(.bottom, -20)
                                .padding(.trailing, 100)
                            Spacer()
                        }
                    }
                    Text("Appointments:")
                        .font(.system(size: 22))
                        .padding(.leading, 15)
                    HStack(alignment: .center) {
                        Spacer()
                        NavigationLink(destination: LiveHelpBookView()) {
                            Text("Book an appointment")
                                .font(.system(size: 22, weight: .bold))
                                .frame(maxWidth: 150)
                                .padding(.vertical, 12)
                                .padding(.horizontal)
                                .foregroundColor(.black)
                        }
                        .background(Color(hex: "#F0DFBE"))
                        .cornerRadius(5)
                        .buttonBorderShape(.roundedRectangle)
                        
                        NavigationLink(destination: LiveHelpManageView()) {
                            Text("Manage Appointments")
                                .font(.system(size: 22, weight: .bold))
                                .frame(maxWidth: 150)
                                .padding(.vertical, 12)
                                .padding(.horizontal)
                                .foregroundColor(.black)
                        }
                        .background(Color(hex: "#F0DFBE"))
                        .cornerRadius(5)
                        .buttonBorderShape(.roundedRectangle)
                        Spacer()
                    }
                    .padding(.bottom, 5)
                    
                    Text("Get live help:")
                        .font(.system(size: 22))
                        .padding(.leading, 15)
                    VStack {
                        ProfileButton(name: "Jane Doe", jobDescription: "Therapist", availability: "Available Now")
                        ProfileButton(name: "Jane Doe", jobDescription: "Therapist", availability: "Available Now")
                        ProfileButton(name: "Jane Doe", jobDescription: "Therapist", availability: "Available Now")
                        ProfileButton(name: "Jane Doe", jobDescription: "Therapist", availability: "Available Now")
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    LiveHelpView()
}
