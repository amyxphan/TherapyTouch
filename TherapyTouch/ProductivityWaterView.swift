//
//  ProductivityWaterView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityWaterView: View {
    @State private var currentImageIndex = 5
    private let totalImages = 5
    @State private var days: [Day] = (1...31).map { Day(dayNumber: $0, isSelected: false) }

    var body: some View {
        ScrollView {
            VStack {
                Text("Hydration")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 20)
                
                Text("Let's view our progress today:")
                    .font(.system(size: 20))
                    .padding(.top, 10)
                
                Text("Current Goal: [User Input]")
                    .padding(.top, 10)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                
                
                Image("Water\(currentImageIndex)")
                    .resizable()
                    .frame(width: 150, height: 180)
                    .padding(.top, 10)
                    .onTapGesture {
                        if currentImageIndex > 1 {
                            currentImageIndex -= 1
                        } else {
                            currentImageIndex = totalImages
                        }
                    }
                
                Spacer()
                
                NavigationLink(destination: ProductivityWaterView()) {
                    Text("Add/Update Goal")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }

                .background(Color(hex: "#B89D6A"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                
                Text("XX [unit of water intake]")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top, 10)
            }
            
            Text("This month:")
                .font(.system(size: 22, weight: .bold))
                .padding(.top, 5)
            
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 7), spacing: 5) {
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

#Preview {
    ProductivityWaterView()
}

