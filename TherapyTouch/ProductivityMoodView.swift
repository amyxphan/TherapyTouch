//
//  ProductivityMoodView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityMoodView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Mood Tracker")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 20)
                
                Text("How are you feeling today?:")
                    .font(.system(size: 20))
                    .padding(.top, 20)
                
                HStack {
                    Image("Mood1")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .onTapGesture {
                            //update calendar
                        }
                    Image("Mood2")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .onTapGesture {
                            //update calendar
                        }
                    Image("Mood3")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .onTapGesture {
                            //update calendar
                        }
                    Image("Mood4")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .onTapGesture {
                            //update calendar
                        }
                    Image("Mood5")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .onTapGesture {
                            //update calendar
                        }
                }
                
                Spacer()
                
                Text("This month:")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top, 40)
                
                //add a monthly tracker here
            }
        }
    }
}

#Preview {
    ProductivityMoodView()
}
