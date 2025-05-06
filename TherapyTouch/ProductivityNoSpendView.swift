//
//  ProductivityNoSpendView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityNoSpendView: View {
    @State private var selectedMonth: Date = Date()
    @State private var saveTracking: [Date: Int] = [:]
    @State private var todaySavings: Int = 0

    private let calendar = Calendar.current

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
        let amount = saveTracking[day] ?? 0
        let isFuture = day > calendar.startOfDay(for: Date())

        if isFuture {
            return Color.gray.opacity(0.2)
        } else if amount > 0 {
            return Color.green.opacity(min(0.3 + Double(amount) / 100.0, 1.0))
        } else {
            return Color.gray.opacity(0.3)
        }
    }

    private func totalSavedThisMonth() -> Int {
        saveTracking
            .filter { calendar.isDate($0.key, equalTo: selectedMonth, toGranularity: .month) }
            .map { $0.value }
            .reduce(0, +)
    }
    
    private func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        return formatter.string(from: date)
    }
    
    // Helper function to map keys in the dictionary
    private func mapKeys<T>(dictionary: [Date: Int], transform: (Date) -> T) -> [T: Int] {
        var result: [T: Int] = [:]
        for (key, value) in dictionary {
            result[transform(key)] = value
        }
        return result
    }

    // Save the no spend data to UserDefaults
    private func saveNoSpend() {
        let key = monthYearString(from: selectedMonth)
        
        // Convert the Date keys to strings
        let stringKeys = mapKeys(dictionary: saveTracking) { date in
            let formatter = ISO8601DateFormatter()
            return formatter.string(from: date)
        }
        
        // Save the dictionary with string keys
        let encodedData = try? JSONEncoder().encode(stringKeys)
        UserDefaults.standard.set(encodedData, forKey: key)
    }

    // Load the no spend data from UserDefaults
    private func loadNoSpend() {
            let key = monthYearString(from: selectedMonth)
            if let savedData = UserDefaults.standard.data(forKey: key),
               let decodedSaveTracking = try? JSONDecoder().decode([Date: Int].self, from: savedData) {
                saveTracking = decodedSaveTracking
            } else {
                saveTracking = [:]
            }
        }

    var body: some View {
        VStack {
            Text("No Spend")
                .font(.system(size: 28, weight: .bold))
                .padding(.top, 10)

            Text("Save any money today?")
                .font(.system(size: 18))

            Button(action: {
                todaySavings += 5
            }) {
                Image("PiggyBank")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 150)
            }
            .padding(.bottom, 10)

            Text("Today's savings: $\(todaySavings)")
                .font(.system(size: 18, weight: .bold))

            Text("Total amount saved: $\(totalSavedThisMonth())")
                .font(.system(size: 18))

            Button(action: {
                let today = calendar.startOfDay(for: Date())
                saveTracking[today, default: 0] += todaySavings
                todaySavings = 0
                saveNoSpend()
            }) {
                Text("Submit")
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                    .background(Color(hex: "#B89D6A"))
                    .cornerRadius(5)
            }

            Text("This month:")
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 15)

            // Calendar Header
            HStack {
                Button(action: {
                    selectedMonth = calendar.date(byAdding: .month, value: -1, to: selectedMonth) ?? selectedMonth
                }) {
                    Image(systemName: "chevron.left")
                }

                Spacer()

                Text(monthYearString(from: selectedMonth))
                    .font(.headline)

                Spacer()

                Button(action: {
                    selectedMonth = calendar.date(byAdding: .month, value: 1, to: selectedMonth) ?? selectedMonth
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.horizontal)
            .padding(.top, 5)

            let daysInMonth = generateDaysInMonth(for: selectedMonth)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 7), spacing: 7) {
                ForEach(daysInMonth, id: \.self) { date in
                    Text("\(calendar.component(.day, from: date))")
                        .font(.system(size: 12))
                        .frame(width: 28, height: 28)
                        .background(backgroundColor(for: date))
                        .cornerRadius(5)
                        .foregroundColor(.black.opacity(0.7))
                }
            }
            .padding(.horizontal)
            .padding(.top, 5)
            .padding(.bottom, 75)
        }
        .onAppear {
            loadNoSpend()
        }
    }
}

#Preview {
    ProductivityNoSpendView()
}
