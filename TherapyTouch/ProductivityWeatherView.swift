//
//  ProductivityWeatherView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityWeatherView: View {
    @State private var days: [Day] = (1...31).map { Day(dayNumber: $0, isSelected: false) }
        var body: some View {
            VStack {
                Text("Weather")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 20)
                
                Text("How's the weather today?")
                    .font(.system(size: 20))
                    .padding(.top, 20)
                
                HStack {
                    Image("Weather1")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .onTapGesture {
                            //update calendar
                        }
                    Image("Weather2")
                        .resizable()
                        .frame(width: 60, height: 50)
                        .onTapGesture {
                            //update calendar
                        }
                    Image("Weather3")
                        .resizable()
                        .frame(width: 50, height: 40)
                        .onTapGesture {
                            //update calendar
                        }
                }
                HStack {
                    Image("Weather4")
                        .resizable()
                        .frame(width: 60, height: 50)
                        .onTapGesture {
                            //update calendar
                        }
                    Image("Weather5")
                        .resizable()
                        .frame(width: 60, height: 50)
                        .onTapGesture {
                            //update calendar
                        }
                    Image("Weather6")
                        .resizable()
                        .frame(width: 60, height: 40)
                        .onTapGesture {
                            //update calendar
                        }
                    Image("Weather7")
                        .resizable()
                        .frame(width: 60, height: 50)
                        .onTapGesture {
                            //update calendar
                        }
                }
                
                Text("This month:")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top, 40)
                
                Spacer()
                
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
    ProductivityWeatherView()
}

