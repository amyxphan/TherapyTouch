//
//  ProductivityMoodView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct Day: Identifiable {
    let id = UUID()
    let dayNumber: Int
    var isSelected: Bool
}

struct ProductivityMoodView: View {
    @State private var days: [Day] = (1...31).map { Day(dayNumber: $0, isSelected: false) }
    var body: some View {
        VStack {
            Text("Mood Tracker")
                .font(.system(size: 28, weight: .bold))
                .padding(.top, 80)
            
            Text("How are you feeling today?")
                .font(.system(size: 20))
                .padding(.top, 10)
            
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
            .padding(.top, 10)
            
            Text("This month:")
                .font(.system(size: 22, weight: .bold))
                .padding(.top, 100)
            
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 7), spacing: 10) {
                    ForEach($days) { $day in
                        Text("\(day.dayNumber)")
                            .frame(width: 40, height: 40)
                            .background(day.isSelected ? Color.green : Color.gray.opacity(0.3))
                            .cornerRadius(5)
                            .onTapGesture {
                                day.isSelected.toggle() // Toggle selection state
                            }
                    }
                }
                .padding()
            }
            .padding(.bottom, 150)
            //add a monthly tracker here
        }
    }
}

#Preview {
    ProductivityMoodView()
}
