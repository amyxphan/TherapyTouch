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

    @AppStorage("waterIntakeData") private var waterIntakeData: Data = Data()
    @State private var waterIntake: [Double] = []

    @State private var selectedMonth: Date = Date()
    @State private var currentOunces = 0.0
    @State private var todaysWaterIntake = 0.0

    private let calendar = Calendar.current
    private let maxWaterIntake = 32.0 // new max intake

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
        if waterIntake.count != days {
            waterIntake = Array(repeating: 0.0, count: days)
        }
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

    private func loadData() {
        let decoder = JSONDecoder()
        if let decoded = try? decoder.decode([Double].self, from: waterIntakeData) {
            waterIntake = decoded
        } else {
            let days = generateDaysInMonth(for: selectedMonth).count
            waterIntake = Array(repeating: 0.0, count: days)
        }
    }

    private func saveData() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(waterIntake) {
            waterIntakeData = encoded
        }
    }

    var body: some View {
        VStack {
            Text("Hydration")
                .font(.system(size: 28, weight: .bold))
                .padding(.top, 100)

            Text("Let's view our progress today:")
                .font(.system(size: 20))
                .padding(.top, 3)

            Image("Water\(currentImageIndex)")
                .resizable()
                .frame(width: 130, height: 160)
                .padding(.top, 10)
                .onTapGesture {
                    if currentImageIndex > 1 {
                        currentImageIndex -= 1
                        if currentOunces < maxWaterIntake {
                            currentOunces += 8
                        }
                    } else {
                        currentImageIndex = totalImages
                        currentOunces = 0
                    }
                }

            Button(action: {
                let today = calendar.component(.day, from: Date())
                let daysInMonth = generateDaysInMonth(for: selectedMonth)
                if let index = daysInMonth.firstIndex(where: {
                    calendar.isDate($0, inSameDayAs: Date())
                }) {
                    waterIntake[index] += currentOunces
                    todaysWaterIntake += currentOunces
                    currentOunces = 0
                    currentImageIndex = totalImages
                    saveData()
                }
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

            Text("\(Int(currentOunces)) oz.")
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 5)

            Text("Water logged today: \(Int(todaysWaterIntake)) oz.")
                .font(.system(size: 18))
                .padding(.top, 2)

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

            let daysInMonth = generateDaysInMonth(for: selectedMonth)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 7), spacing: 7) {
                if waterIntake.count == daysInMonth.count {
                    ForEach(Array(daysInMonth.enumerated()), id: \ .0) { index, date in
                        Rectangle()
                            .fill(color(for: waterIntake[index]))
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
            let days = generateDaysInMonth(for: selectedMonth).count
            updateWaterIntake(for: days)
            loadData()
        }
    }

    private func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        return formatter.string(from: date)
    }
}

extension Color {
    init(hexString: String) {
        let scanner = Scanner(string: hexString)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    ProductivityWaterView()
}
