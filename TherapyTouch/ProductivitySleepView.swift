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
        let clamped = max(min(hours, 12), 0)
        let percent = clamped / 12.0

        return Color(
            red: Double(1 - percent) * 0.8 + Double(percent) * 0.0,
            green: Double(1 - percent) * 1.0 + Double(percent) * 0.5,
            blue: Double(1 - percent) * 0.8 + Double(percent) * 0.0
        )
    }

    var body: some View {
        ScrollView {
            VStack {
                Text("Sleep")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)

                Spacer()

                CustomSlider(value: $count, range: sliderRange)
                    .frame(height: 60)
                    .padding()

                Text("Hours of Sleep: \(Int(count))")
                    .font(.title)
                    .padding()

                Spacer()

                Text("This month:")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top, 100)

                let daysInMonth = generateDaysInMonth(for: selectedMonth)

                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 7), spacing: 10) {
                    if sleepHours.count == daysInMonth.count {
                        ForEach(Array(daysInMonth.enumerated()), id: \.0) { index, date in
                            Rectangle()
                                .fill(color(for: sleepHours[index]))
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    sleepHours[index] = count
                                }
                                .overlay(
                                    Text("\(calendar.component(.day, from: date))")
                                        .font(.system(size: 8))
                                        .foregroundStyle(.black.opacity(0.7))
                                )
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                let daysInMonth = generateDaysInMonth(for: selectedMonth).count
                updateSleepHours(for: daysInMonth)
            }
        }
    }
}
