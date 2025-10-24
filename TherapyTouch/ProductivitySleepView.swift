//
//  ProductivitySleepView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/17/24.

import SwiftUI

struct CustomSlider: View {
    @Binding var value: Double
    let range: ClosedRange<Double>

    var body: some View {
        GeometryReader { geometry in
            let trackWidth = geometry.size.width
            let thumbSize: CGFloat = 50
            let progress = CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound))

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 6)
                    .frame(width: trackWidth - thumbSize)
                    .offset(x: thumbSize / 2)

                Image("Bed")
                    .resizable()
                    .frame(width: thumbSize, height: thumbSize)
                    .offset(x: progress * (trackWidth - thumbSize))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                let clampedOffset = min(max(0, gesture.location.x), trackWidth - thumbSize)
                                let newValue = clampedOffset / (trackWidth - thumbSize)
                                value = newValue * (range.upperBound - range.lowerBound) + range.lowerBound
                            }
                    )
            }
            .frame(height: thumbSize)
        }
        .frame(height: 60)
    }
}


struct ProductivitySleepView: View {
    @State private var count: Double = 0
    private let sliderRange: ClosedRange<Double> = 0...12

    @State private var sleepHours: [Double] = []
    @State private var selectedMonth: Date = Date()

    private let calendar = Calendar.current

    private func generateDaysInMonth(for date: Date) -> [Date] {
        guard let range = calendar.range(of: .day, in: .month, for: date) else { return [] }
        let components = calendar.dateComponents([.year, .month], from: date)
        return range.compactMap { day -> Date? in
            var newComponents = components
            newComponents.day = day
            return calendar.date(from: newComponents)
        }
    }

    private func updateSleepHours(for days: Int) {
        sleepHours = Array(repeating: 0.0, count: days)
    }

    private func color(for hours: Double) -> Color {
        // If no sleep recorded (0), return light gray
        if hours == 0 {
            return Color.gray.opacity(0.3)
        }

        let clamped = max(min(hours, 12), 0)
        let percent = clamped / 12.0

        return Color(
            red: Double(1 - percent) * 0.0 + Double(percent) * 0.0,
            green: Double(1 - percent) * 0.8 + Double(percent) * 0.5,
            blue: Double(1 - percent) * 0.0 + Double(percent) * 0.0
        )
    }

    private func changeMonth(by value: Int) {
        if let newDate = calendar.date(byAdding: .month, value: value, to: selectedMonth) {
            selectedMonth = newDate
            let days = generateDaysInMonth(for: newDate).count
            updateSleepHours(for: days)
            loadSleepHours()
        }
    }

    private func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        return formatter.string(from: date)
    }
    
    // Save the sleep hours to UserDefaults
    private func saveSleepHours() {
        let key = monthYearString(from: selectedMonth)
        let encodedData = try? JSONEncoder().encode(sleepHours)
        UserDefaults.standard.set(encodedData, forKey: key)
    }
    
    // Load the sleep hours from UserDefaults
    private func loadSleepHours() {
        let key = monthYearString(from: selectedMonth)
        if let savedData = UserDefaults.standard.data(forKey: key),
           let decodedSleepHours = try? JSONDecoder().decode([Double].self, from: savedData) {
            sleepHours = decodedSleepHours
        } else {
            let days = generateDaysInMonth(for: selectedMonth).count
            updateSleepHours(for: days)
        }
    }

    var body: some View {
        VStack {
            Text("Sleep")
                .font(.system(size: 28, weight: .bold))
                .padding(.top, 40)

            Text("How'd you sleep?")
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 5)
                .padding(.bottom, 10)

            CustomSlider(value: $count, range: sliderRange)
                .frame(height: 60)
                .padding()

            Text("Hours of Sleep: \(Int(count))")
                .font(.system(size: 18, weight: .bold))
                .padding(.top, 5)
                .padding(.bottom, 10)

            // Submit button that saves the response
            Button(action: {
                let dayIndex = calendar.component(.day, from: selectedMonth)
                sleepHours[dayIndex - 1] = count
                saveSleepHours()

                // 🕒 Save timestamp and value for latest sleep submission
                let timestamp = Date()
                UserDefaults.standard.set(timestamp, forKey: "lastSleepSubmissionTime")
                UserDefaults.standard.set(count, forKey: "lastSleepSubmissionValue")
            }) {
                Text("Submit")
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
            }
            .background(Color(hex: "#B89D6A"))
            .cornerRadius(5)
            .padding(.top)


            // Month selector
            Text("This month:")
                .font(.system(size: 22, weight: .bold))
                .padding(.top, 30)

            HStack {
                Button(action: { changeMonth(by: -1) }) {
                    Image(systemName: "chevron.left")
                        .padding()
                }

                Spacer()

                Text(monthYearString(from: selectedMonth))
                    .font(.headline)

                Spacer()

                Button(action: { changeMonth(by: 1) }) {
                    Image(systemName: "chevron.right")
                        .padding()
                }
            }
            .padding(.horizontal)

            // Calendar Grid
            let daysInMonth = generateDaysInMonth(for: selectedMonth)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 7), spacing: 10) {
                if sleepHours.count == daysInMonth.count {
                    ForEach(Array(daysInMonth.enumerated()), id: \.0) { index, date in
                        Rectangle()
                            .fill(color(for: sleepHours[index]))  // Apply light gray if 0 sleep
                            .frame(width: 28, height: 28)
                            .cornerRadius(5)
                            .overlay(
                                Text("\(calendar.component(.day, from: date))")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.black.opacity(0.7))
                            )
                    }
                }
            }
            .padding(.bottom, 125)
            .padding(.top, 5)
            .padding(.horizontal)
        }
        .onAppear {
            loadSleepHours()
        }
    }
}

#Preview {
    ProductivitySleepView()
}
