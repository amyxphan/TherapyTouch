//
//  ProductivityView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/23/24.
//
import SwiftUI

struct ProductivityView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Productivity")
                    .font(.system(size: 28, weight: .bold))
                // need to make a functional add button to add more personalized goals
                Button(action: {
                    // Button action here
                }, label: {
                    Text("+")
                        .frame(maxWidth: 325)
                        .padding(.vertical, 25)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                })
                Button(action: {
                    // Button action here
                }, label: {
                    Text("Water")
                        .frame(maxWidth: 325)
                        .padding(.vertical, 18)
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
                    Text("Mood")
                        .frame(maxWidth: 325)
                        .padding(.vertical, 18)
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
                    Text("Weather")
                        .frame(maxWidth: 325)
                        .padding(.vertical, 18)
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
                    Text("Sleep")
                        .frame(maxWidth: 325)
                        .padding(.vertical, 18)
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
                    Text("Workout")
                        .frame(maxWidth: 325)
                        .padding(.vertical, 18)
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
                    Text("No Spend")
                        .frame(maxWidth: 325)
                        .padding(.vertical, 18)
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
                    Text("Supplements")
                        .frame(maxWidth: 325)
                        .padding(.vertical, 18)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                })
                .background(Color(hex: "#F0DFBE"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 5)
                
            }
        }
    }
}

#Preview {
    ProductivityView()
}
