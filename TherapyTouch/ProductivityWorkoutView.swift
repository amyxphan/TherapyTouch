//
//  ProductivityWorkoutView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityWorkoutView: View {
    @State private var days: [Day] = (1...30).map { Day(dayNumber: $0, isSelected: false) }
    var body: some View {
        ScrollView {
            VStack {
                Text("Workout")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("Did you workout today?")
                Spacer()
                
                NavigationLink(destination: ProductivityWorkoutView()) {
                    Text("Add/Update Goal")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }
                .background(Color(hex: "#B89D6A"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 50)
                
                Button(action: {
                    // Phone action here
                }, label: {
                    Image("Workout")
                    // update picutre
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color(hex: "#B89D6A"))
                        .clipShape(Circle())
                })
                .padding(.bottom, 4)
                .padding(.leading, 6)
                
                Text("XX minutes")
                Spacer()
                
                Text("Current Goal")
                Spacer()
                
                Text("This month:")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top, 10)
                
                VStack {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 7), spacing: 10) {
                        ForEach($days) { $day in
                            Text("\(day.dayNumber)")
                                .frame(width: 40, height: 40)
                                .background(day.isSelected ? Color.green : Color.gray.opacity(0.3))
                                .cornerRadius(5)
                                .onTapGesture {
                                    day.isSelected.toggle()
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
}

#Preview {
    ProductivityWorkoutView()
}
