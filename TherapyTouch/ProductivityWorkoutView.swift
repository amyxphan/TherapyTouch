//
//  ProductivityWorkoutView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityWorkoutView: View {
    @State private var selectedMonth: Date = Date()
    @State private var workoutTracking: [Date: Int] = [:]
    @State private var todayMinutes: Int = 0

    private let calendar = Calendar.current

    // MARK: - Generate all days in the selected month
    private func generateDaysInMonth(for date: Date) -> [Date] {
        guard let range = calendar.range(of: .day, in: .month, for: date),
              let monthStart = calendar.date(from: calendar.dateComponents([.year, .month], from: date)) else {
            return []
        }

        return range.compactMap { day in
            calendar.date(byAdding: .day, value: day - 1, to: monthStart)
        }
    }
    private func backgroundColor(for date: Date) -> Color {
        let day = calendar.startOfDay(for: date)
        let minutes = workoutTracking[day] ?? 0
        let isFuture = day > calendar.startOfDay(for: Date())

        if isFuture {
            return Color.gray.opacity(0.2)
        } else if minutes > 0 {
            // More minutes = darker green
            return Color.green.opacity(min(0.3 + Double(minutes) / 100.0, 1.0))
        } else {
            return Color.gray.opacity(0.3)
        }
    }

    private func totalMinutesThisMonth() -> Int {
        workoutTracking
            .filter { calendar.isDate($0.key, equalTo: selectedMonth, toGranularity: .month) }
            .map { $0.value }
            .reduce(0, +)
    }

    private func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        return formatter.string(from: date)
    }

    private func mapKeys<T>(dictionary: [Date: Int], transform: (Date) -> T) -> [T: Int] {
        var result: [T: Int] = [:]
        for (key, value) in dictionary {
            result[transform(key)] = value
        }
        return result
    }

    private func saveWorkout() {
        let key = monthYearString(from: selectedMonth)
        let stringKeys = mapKeys(dictionary: workoutTracking) { date in
            let formatter = ISO8601DateFormatter()
            return formatter.string(from: date)
        }

        if let encodedData = try? JSONEncoder().encode(stringKeys) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }

    private func loadWorkout() {
        let key = monthYearString(from: selectedMonth)
        if let savedData = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([String: Int].self, from: savedData) {
            var temp: [Date: Int] = [:]
            let formatter = ISO8601DateFormatter()
            for (key, value) in decoded {
                if let date = formatter.date(from: key) {
                    temp[calendar.startOfDay(for: date)] = value
                }
            }
            workoutTracking = temp
        } else {
            workoutTracking = [:]
        }
    }

    var body: some View {
        ScrollView {
            VStack {
                Text("Workout Tracker")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)

                Text("How many minutes did you work out today?")
                    .font(.system(size: 18))
                    .padding(.top, 5)

                // Increase minutes
                Button(action: {
                    todayMinutes += 10
                }) {
                    Image("workout")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                }
                .padding(.vertical, 5)

                Text("Today's workout: \(todayMinutes) min")
                    .font(.system(size: 18, weight: .bold))

                Text("Total this month: \(totalMinutesThisMonth()) min")
                    .font(.system(size: 18))

                // Submit button
                Button(action: {
                    let today = calendar.startOfDay(for: Date())
                    workoutTracking[today, default: 0] += todayMinutes
                    saveWorkout()

                    let timestamp = Date()
                    UserDefaults.standard.set(timestamp, forKey: "lastWorkoutSubmissionTime")
                    UserDefaults.standard.set(todayMinutes, forKey: "lastWorkoutSubmissionValue")
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

                Text("This month:")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 10)

                // Calendar navigation
                HStack {
                    Button(action: {
                        selectedMonth = calendar.date(byAdding: .month, value: -1, to: selectedMonth) ?? selectedMonth
                        loadWorkout()
                    }) {
                        Image(systemName: "chevron.left")
                    }

                    Spacer()

                    Text(monthYearString(from: selectedMonth))
                        .font(.headline)

                    Spacer()

                    Button(action: {
                        selectedMonth = calendar.date(byAdding: .month, value: 1, to: selectedMonth) ?? selectedMonth
                        loadWorkout()
                    }) {
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(.horizontal)
                .padding(.top, 5)

                // Calendar grid
                let daysInMonth = generateDaysInMonth(for: selectedMonth)

                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 7), spacing: 7) {
                    ForEach(daysInMonth, id: \.self) { date in
                        Text("\(calendar.component(.day, from: date))")
                            .font(.system(size: 12))
                            .frame(width: 30, height: 30)
                            .background(backgroundColor(for: date))
                            .cornerRadius(5)
                            .foregroundColor(.black.opacity(0.7))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 5)
                .padding(.bottom, 75)
            }
        }
        .onAppear {
            loadWorkout()
        }
    }
}

#Preview {
    ProductivityWorkoutView()
}
