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

    @State private var waterIntake: [Double] = []
    @State private var selectedMonth: Date = Date()

    private let calendar = Calendar.current
    private let maxWaterIntake = 128.0 // example max in ounces

    // Generates array of dates for a given month
    private func generateDaysInMonth(for date: Date) -> [Date] {
        guard let range = calendar.range(of: .day, in: .month, for: date) else { return [] }
        let components = calendar.dateComponents([.year, .month], from: date)
        return range.compactMap { day -> Date? in
            var newComponents = components
            newComponents.day = day
            return calendar.date(from: newComponents)
        }
    }

    private func updateWaterIntake(for days: Int) {
        waterIntake = Array(repeating: 0.0, count: days)
    }

    private func color(for ounces: Double) -> Color {
        let clamped = max(min(ounces, maxWaterIntake), 0)
        let darkness = 0.2 + (clamped / maxWaterIntake) * 0.6
        return Color.blue.opacity(darkness)
    }

    private func changeMonth(by value: Int) {
        if let newDate = calendar.date(byAdding: .month, value: value, to: selectedMonth) {
            selectedMonth = newDate
            let days = generateDaysInMonth(for: newDate).count
            updateWaterIntake(for: days)
        }
    }

    var body: some View {
            // add edit button on top right to edit goal
            VStack {
                Text("Hydration")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 100)

                Text("Let's view our progress today:")
                    .font(.system(size: 20))
                    .padding(.top, 3)

                Text("Current Goal: [User Input]")
                    .font(.system(size: 20))
                    .foregroundColor(.black)

                Image("Water\(currentImageIndex)")
                    .resizable()
                    .frame(width: 140, height: 170)
                    .padding(.top, 10)
                    .onTapGesture {
                        if currentImageIndex > 1 {
                            currentImageIndex -= 1
                        } else {
                            currentImageIndex = totalImages
                        }
                    }
                // edit submit button to update calendar 
                NavigationLink(destination: ProductivityWaterView()) {
                    Text("Submit")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }
                .background(Color(hex: "#B89D6A"))
                .cornerRadius(5)
                .padding(.top)

                Text("XX [unit of water intake]")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 5)

                // Calendar header
                Text("This month:")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 5)
                    .padding(.bottom, 5)

                HStack {
                    Button(action: { changeMonth(by: -1) }) {
                        Image(systemName: "chevron.left")
                    }
                    Spacer()
                    Text(monthYearString(from: selectedMonth))
                        .font(.headline)
                    Spacer()
                    Button(action: { changeMonth(by: 1) }) {
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(.horizontal)

                // Calendar grid
                let daysInMonth = generateDaysInMonth(for: selectedMonth)

                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 7), spacing: 7) {
                    if waterIntake.count == daysInMonth.count {
                        ForEach(Array(daysInMonth.enumerated()), id: \.0) { index, date in
                            Rectangle()
                                .fill(color(for: waterIntake[index]))
                                .frame(width: 28, height: 28)
                                .cornerRadius(5)
                                .onTapGesture {
                                    waterIntake[index] += 8 // Add 8 oz per tap
                                }
                                .overlay(
                                    Text("\(calendar.component(.day, from: date))")
                                        .font(.system(size: 12))
                                        .foregroundColor(.black.opacity(0.7))
                                )
                        }
                    }
                }
                .padding(.bottom, 125)
                .padding(.top, 5)
                .padding(.horizontal)
            }
            .onAppear {
                let days = generateDaysInMonth(for: selectedMonth).count
                updateWaterIntake(for: days)
            }
        }

    private func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        return formatter.string(from: date)
    }
}

