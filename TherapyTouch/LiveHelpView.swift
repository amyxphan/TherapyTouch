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
            VStack(alignment: .leading) {
                Text("Appointments:")
                    .font(.system(size: 22))
                HStack(alignment: .center) {
                    Button(action: {
                        // Button action here
                    }, label: {
                        Text("Book an appointment")
                            .font(.system(size: 22, weight: .bold))
                            .frame(maxWidth: 150)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                    })
                    .background(Color(hex: "#F0DFBE"))
                    .cornerRadius(5)
                    .buttonBorderShape(.roundedRectangle)
                    
                    Button(action: {
                        // Button action here
                    }, label: {
                        Text("Cancel an appointment")
                            .font(.system(size: 22, weight: .bold))
                            .frame(maxWidth: 150)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                    })
                    .background(Color(hex: "#F0DFBE"))
                    .cornerRadius(5)
                    .buttonBorderShape(.roundedRectangle)
                }
                .padding(.bottom, 5)
                Text("Get live help:")
                    .font(.system(size: 22))
                Button(action: {
                    // Button action here
                }, label: {
                    Text("Therapist Name Card")
                        .frame(maxWidth: 325)
                        .padding(.vertical, 65)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                })
                .background(Color(hex: "#F0DFBE"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 5)
                
                Button(action: {
                    // Button action here
                }, label: {
                    Text("Therapist Name Card")
                        .frame(maxWidth: 325)
                        .padding(.vertical, 65)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                })
                .background(Color(hex: "#F0DFBE"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 5)
                
                Button(action: {
                    // Button action here
                }, label: {
                    Text("Therapist Name Card")
                        .frame(maxWidth: 325)
                        .padding(.vertical, 65)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                })
                .background(Color(hex: "#F0DFBE"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 5)

            }
            .navigationTitle("Let's Talk!")
        }
    }
}

#Preview {
    LiveHelpView()
}
