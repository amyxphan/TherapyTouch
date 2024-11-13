//
//  HomeView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/23/24.
//
import SwiftUI

struct HomeView: View {
    @State private var currentQuote = QuoteGenerator().getRandomQuote()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 5) {
                    ZStack(alignment: .bottomTrailing) {
                            Text("Hello! [NAME]")
                                .font(.system(size: 28, weight: .bold))
                                .padding(.top, 40)
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
                    //future: need to add functionality to let user customize how many times quote should update
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
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Recent Activity:")
                            .font(.system(size: 18))
                        HomeRecentActivity(category: "Weather", submition: 12, data: "Cloudy")
                            .frame(height: 90)
                        HomeRecentActivity(category: "Water", submition: 10, data: "16 oz")
                            .frame(height: 90)
                        HomeRecentActivity(category: "Sleep", submition: 8, data: "8 hours")
                            .frame(height: 90)
                    }
                    .padding(.bottom, 8)
                    
                    // Milestones Section
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Milestones:")
                                .font(.system(size: 18))
                            
                            Spacer() // Pushes the "+" button to the right

                            NavigationLink(destination: MilestonesNewView()) {
                                Text("+")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(Color(hex: "#B89D6A"))
                            }
                        }
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: "#F0DFBE"))
                            .frame(height: 90)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
}
