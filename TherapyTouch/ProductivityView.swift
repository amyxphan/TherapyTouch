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
                    NavigationLink(destination: ProductivityNewView()) {
                        Text("+")
                            .font(.system(size: 22, weight: .bold))
                            .frame(maxWidth: 325)
                            .padding(.leading, 325)
                            .foregroundColor(Color(hex: "#B89D6A"))
                    }
                    NavigationLink(destination: ProductivityWaterView()) {
                        Text("Hydration")
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
                    
                    NavigationLink(destination: ProductivityStepsView()) {
                        Text("Steps")
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
