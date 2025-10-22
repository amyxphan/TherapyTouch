//
//  LiveHelpBookView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/14/24.
//

import SwiftUI

struct LiveHelpBookView: View {
    var name: String = "Jane Doe"
    var jobDescription: String = "Job Description"

    // Generate a random work-time string like "9:30 AM" or "2:00 PM"
    func randomWorkTime() -> String {
        let hour = Int.random(in: 8...17) // 8 AM to 5 PM
        let period = hour < 12 ? "AM" : "PM"
        let displayHour = hour > 12 ? hour - 12 : hour
        return "\(displayHour)\(period)"
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<2) { _ in // Example: 2 cards
                    Button(action: {
                        // Main button action here
                    }, label: {
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    Text(name)
                                        .font(.system(size: 22, weight: .bold))
                                        .padding(.leading, 8)
                                        .padding(.top, 2)
                                        .foregroundColor(.black)
                                    
                                    Text(jobDescription)
                                        .font(.system(size: 15))
                                        .padding(.leading, 8)
                                        .foregroundColor(.black)
                                    
                                    HStack {
                                        Image(systemName: "message")
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .padding(6)
                                            .background(Color(hex: "#B89D6A"))
                                            .clipShape(Circle())
                                        
                                        Image(systemName: "phone")
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .padding(6)
                                            .background(Color(hex: "#B89D6A"))
                                            .clipShape(Circle())
                                        
                                        Image(systemName: "video")
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .padding(8)
                                            .background(Color(hex: "#B89D6A"))
                                            .clipShape(Circle())
                                    }
                                    .padding(.leading, 8)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "person")
                                    .font(.system(size: 75))
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .padding(.trailing, 5)
                                    .padding(.top, 10)
                            }
                            .padding()
                            
                            Text("Available Appointments:")
                                .font(.system(size: 18, weight: .bold))
                                .padding(.leading, 15)
                                .foregroundColor(.black)
                            
                            // Days of the week with random times
                            ForEach(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"], id: \.self) { day in
                                Text("\(day):")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                    .padding(.leading, 15)
                                    .padding(.top, 5)
                                
                                HStack {
                                    ForEach(0..<4) { _ in // Up to 4 random times per day
                                        Button(action: {
                                            // Main button action here
                                        }, label: {
                                            Text(randomWorkTime())
                                                .font(.system(size: 15))
                                                .foregroundColor(.white)
                                                .padding(12)
                                                .background(Color(hex: "#B89D6A"))
                                                .clipShape(Circle())
                                        })
                                    }
                                }
                                .padding(.leading, 10)
                                .padding(.bottom, 20)
                            }
                        }
                    })
                    .background(Color(hex: "#F0DFBE"))
                    .cornerRadius(5)
                    .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom, 5)
                    .padding(.leading, 20)
                    .frame(maxWidth: 375)
                }
            }
        }
    }
}

struct LiveHelpBookView_Previews: PreviewProvider {
    static var previews: some View {
        LiveHelpBookView()
    }
}
