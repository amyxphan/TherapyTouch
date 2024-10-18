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
            ScrollView {
                VStack(alignment: .center) {
                    Text("Productivity")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.vertical, 45)
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
                    NavigationLink(destination: ProductivityWaterView()) {
                        Text("Water")
                            .frame(maxWidth: 325)
                            .padding(.vertical, 18)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                    }
                    .background(Color(hex: "#F0DFBE"))
                    .cornerRadius(5)
                    .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom, 5)
                    
                    NavigationLink(destination: ProductivityMoodView()) {
                        Text("Mood")
                            .frame(maxWidth: 325)
                            .padding(.vertical, 18)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                    }
                    .background(Color(hex: "#F0DFBE"))
                    .cornerRadius(5)
                    .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom, 5)
                    
                    NavigationLink(destination: ProductivityWeatherView()) {
                        Text("Weather")
                            .frame(maxWidth: 325)
                            .padding(.vertical, 18)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                    }
                    .background(Color(hex: "#F0DFBE"))
                    .cornerRadius(5)
                    .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom, 5)
                    
                    NavigationLink(destination: ProductivitySleepView()) {
                        Text("Sleep")
                            .frame(maxWidth: 325)
                            .padding(.vertical, 18)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                    }
                    .background(Color(hex: "#F0DFBE"))
                    .cornerRadius(5)
                    .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom, 5)
                    
                    NavigationLink(destination: ProductivityWorkoutView()) {
                        Text("Workout")
                            .frame(maxWidth: 325)
                            .padding(.vertical, 18)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                    }
                    .background(Color(hex: "#F0DFBE"))
                    .cornerRadius(5)
                    .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom, 5)
                    
                    NavigationLink(destination: ProductivityNoSpendView()) {
                        Text("No Spend")
                            .frame(maxWidth: 325)
                            .padding(.vertical, 18)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                    }
                    .background(Color(hex: "#F0DFBE"))
                    .cornerRadius(5)
                    .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom, 5)
                    
                    NavigationLink(destination: ProductivitySupplementView()) {
                        Text("Supplements")
                            .frame(maxWidth: 325)
                            .padding(.vertical, 18)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                    }
                    .background(Color(hex: "#F0DFBE"))
                    .cornerRadius(5)
                    .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom, 5)
                    
                }
            }
        }
    }
}

#Preview {
    ProductivityView()
}
