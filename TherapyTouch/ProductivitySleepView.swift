//
//  ProductivitySleepView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivitySleepView: View {
    //add slider functionalities
    @State private var count: Int = 0
    private let sliderWidth: CGFloat = 300
    
    //add calendar functionalities
    @State private var activityLevels: [Int] = []
    @State private var selectedMonth: Date = Date()
        
    private let calendar = Calendar.current
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 7)
    
    private func generateDaysInMonth(for date: Date) -> [Date] {
        let range = calendar.range(of: .day, in: .month, for: date)!
        let components = calendar.dateComponents([.year, .month], from: date)
        return range.compactMap { day -> Date? in
            var newComponents = components
            newComponents.day = day
            return calendar.date(from: newComponents)
        }
    }
    
    private func updateActivityLevels(for days: Int) {
        activityLevels = Array(repeating: Int.random(in: 0...3), count: days)
    }
    
    private func color(for activityLevel: Int) -> Color {
        switch activityLevel {
        case 0: return Color.gray.opacity(0.3)
        case 1: return Color.green.opacity(0.5)
        case 2: return Color.green.opacity(0.7)
        case 3: return Color.green
        default: return Color.green
        }
    }
        
    var body: some View {
        ScrollView {
            VStack {
                Text("Sleep")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                
                Spacer()
                
                ZStack {
                    Slider(
                        value: Binding(
                            get: { Double(count) },
                            set: { count = Int($0) }
                        ),
                        in: 0...24,
                        step: 1
                    )
                    .padding()
                    
                    Image("Bed")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                }
                
                Text("Hours of Sleep: \(count)")
                    .font(.title)
                    .padding()
                
                Spacer()
                
                Text("This month:")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top, 100)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(Array(generateDaysInMonth(for: selectedMonth).enumerated()), id: \.0) { index, date in
                            Rectangle()
                                .fill(color(for: activityLevels[index]))
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    
                                    activityLevels[index] = (activityLevels[index] + 1) % 4
                                }
                                .overlay(
                                    Text("\(calendar.component(.day, from: date))")
                                        .font(.system(size: 8))
                                        .foregroundColor(.black.opacity(0.7))
                                )
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                updateActivityLevels(for: generateDaysInMonth(for: selectedMonth).count)
            }
        }
    }
}

#Preview {
    ProductivitySleepView()
}
