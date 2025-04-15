//
//  ProductivityMoodView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityMoodView: View {
    @State private var selectedMood: Int = 3
    @State private var moodRatings: [Int] = []
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

    private func updateMoodRatings(for days: Int) {
        moodRatings = Array(repeating: 0, count: days)
    }

    private func color(for mood: Int) -> Color {
        switch mood {
        case 1: return Color(red: 0.7, green: 1.0, blue: 0.7)   // soft green
        case 2: return Color(red: 0.85, green: 1.0, blue: 0.85) // light green
        case 3: return Color(red: 1.0, green: 1.0, blue: 0.7)   // pale yellow
        case 4: return Color(red: 1.0, green: 0.85, blue: 0.7)  // soft orange
        case 5: return Color(red: 1.0, green: 0.7, blue: 0.7)   // light red
        default: return Color.gray.opacity(0.15)               // default
        }
    }

    private func changeMonth(by value: Int) {
        if let newDate = calendar.date(byAdding: .month, value: value, to: selectedMonth) {
            selectedMonth = newDate
            let days = generateDaysInMonth(for: newDate).count
            updateMoodRatings(for: days)
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Mood Tracker")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 40)

                // Mood Selection with Images
                VStack(spacing: 10) {
                    Text("How do you feel today?")
                        .font(.headline)

                    HStack(spacing: 15) {
                        ForEach(1...5, id: \.self) { mood in
                            Image("Mood\(mood)") // e.g., mood1, mood2, ...
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding(6)
                                .background(
                                    Circle()
                                        .stroke(selectedMood == mood ? Color.blue : Color.clear, lineWidth: 2)
                                )
                                .onTapGesture {
                                    selectedMood = mood
                                }
                        }
                    }
                }

                // Calendar Navigation
                HStack {
                    Button(action: { changeMonth(by: -1) }) {
                        Image(systemName: "chevron.left")
                    }

                    Text(monthYearString(from: selectedMonth))
                        .font(.headline)
                        .frame(maxWidth: .infinity)

                    Button(action: { changeMonth(by: 1) }) {
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(.horizontal)

                // Calendar Grid
                let daysInMonth = generateDaysInMonth(for: selectedMonth)

                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 7), spacing: 10) {
                    if moodRatings.count == daysInMonth.count {
                        ForEach(Array(daysInMonth.enumerated()), id: \.0) { index, date in
                            Rectangle()
                                .fill(color(for: moodRatings[index]))
                                .frame(width: 30, height: 30)
                                .cornerRadius(6)
                                .onTapGesture {
                                    moodRatings[index] = selectedMood
                                }
                                .overlay(
                                    Text("\(calendar.component(.day, from: date))")
                                        .font(.system(size: 8))
                                        .foregroundColor(.black.opacity(0.7))
                                )
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                let daysInMonth = generateDaysInMonth(for: selectedMonth).count
                updateMoodRatings(for: daysInMonth)
            }
        }
    }

    private func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        return formatter.string(from: date)
    }
}
