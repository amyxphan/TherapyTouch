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

    // Generate a unique key per month/year
    private func moodKey(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        return "moodData-\(formatter.string(from: date))"
    }

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

    private func loadMoodRatings() {
        let key = moodKey(for: selectedMonth)
        if let saved = UserDefaults.standard.array(forKey: key) as? [Int] {
            moodRatings = saved
        } else {
            updateMoodRatings(for: generateDaysInMonth(for: selectedMonth).count)
        }
    }

    private func saveMoodRatings() {
        let key = moodKey(for: selectedMonth)
        UserDefaults.standard.set(moodRatings, forKey: key)
    }

    private func color(for mood: Int) -> Color {
        switch mood {
        case 1: return Color(red: 0.7, green: 1.0, blue: 0.7)   // soft green
        case 2: return Color(red: 0.85, green: 1.0, blue: 0.85) // light green
        case 3: return Color(red: 1.0, green: 1.0, blue: 0.7)   // pale yellow
        case 4: return Color(red: 1.0, green: 0.85, blue: 0.7)  // soft orange
        case 5: return Color(red: 1.0, green: 0.7, blue: 0.7)   // light red
        default: return Color.gray.opacity(0.15)
        }
    }

    private func changeMonth(by value: Int) {
        if let newDate = calendar.date(byAdding: .month, value: value, to: selectedMonth) {
            selectedMonth = newDate
            loadMoodRatings()
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Mood Tracker")
                .font(.system(size: 28, weight: .bold))
                .padding(.top, 40)

            VStack(spacing: 10) {
                Text("How are you today?")
                    .font(.system(size: 20))
                    .padding(.top, 10)
                    .padding(.bottom, 10)

                HStack(spacing: 15) {
                    ForEach(1...5, id: \.self) { mood in
                        Image("Mood\(mood)")
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

                // Submit button saves today's mood
                Button {
                    let dayIndex = calendar.component(.day, from: Date()) - 1
                    if moodRatings.indices.contains(dayIndex) {
                        moodRatings[dayIndex] = selectedMood
                        saveMoodRatings()
                    }
                    let timestamp = Date()
                    UserDefaults.standard.set(timestamp, forKey: "lastMoodSubmissionTime")
                    UserDefaults.standard.set(selectedMood, forKey: "lastMoodSubmissionValue")
                } label: {
                    Text("Submit")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                        .background(Color(hex: "#B89D6A"))
                        .cornerRadius(5)
                }
                .padding(.top)
            }

            // Calendar header
            Text("This month:")
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 20)
                .padding(.bottom, 5)

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

            // Calendar grid
            let daysInMonth = generateDaysInMonth(for: selectedMonth)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 7), spacing: 10) {
                if moodRatings.count == daysInMonth.count {
                    ForEach(Array(daysInMonth.enumerated()), id: \.0) { index, date in
                        Rectangle()
                            .fill(color(for: moodRatings[index]))
                            .frame(width: 28, height: 28)
                            .cornerRadius(5)
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
            loadMoodRatings()
        }
    }

    private func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        return formatter.string(from: date)
    }
}

#Preview {
    ProductivityMoodView()
}
