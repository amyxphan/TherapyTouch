//
//  ProductivitySleepView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/17/24.

import SwiftUI

struct ProductivitySleepView: View {
    @State private var count: Double = 0
    private let sliderRange: ClosedRange<Double> = 0...24

    @State private var activityLevels: [Int] = []
    @State private var selectedMonth: Date = Date()

    private let calendar = Calendar.current

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

                ScrollView {
                    let columns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 7)

                    LazyVGrid(columns: columns, spacing: 10) {
                        
                        let daysInMonth = generateDaysInMonth(for: selectedMonth)

                        if activityLevels.count == daysInMonth.count {
                            ForEach(Array(daysInMonth.enumerated()), id: \.0) { index, date in
                                Rectangle()
                                    .fill(color(for: activityLevels[index]))
                                    .frame(width: 30, height: 30)
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
                    }
                    .padding()
                }
            }
            .onAppear {
                let daysInMonth = generateDaysInMonth(for: selectedMonth).count
                updateActivityLevels(for: daysInMonth)
            }
        }
    }
}

struct CustomSlider: View {
    @Binding var value: Double
    let range: ClosedRange<Double>

    var body: some View {
        GeometryReader { geometry in
            let trackWidth = geometry.size.width
            let thumbSize: CGFloat = 50
            let progress = CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound))

            ZStack(alignment: .leading) {
                // Slider Track
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 6)
                    .frame(width: trackWidth - thumbSize) // Shrink track to account for thumb size
                    .offset(x: thumbSize / 2) // Center the track under the thumb

                // Thumb (Image)
                Image("Bed")
                    .resizable()
                    .frame(width: thumbSize, height: thumbSize)
                    // Align the thumb fully to the left
                    .offset(x: progress * (trackWidth - thumbSize))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                let thumbOffset = gesture.location.x
                                // Ensure the thumb stays within the bounds of the track
                                let clampedOffset = min(max(0, thumbOffset), trackWidth - thumbSize)
                                let newValue = clampedOffset / (trackWidth - thumbSize)
                                value = newValue * (range.upperBound - range.lowerBound) + range.lowerBound
                            }
                    )
            }
            .frame(height: thumbSize)
        }
        .frame(height: 60) // Adjust the height as needed
        .padding(.leading, 0) // Remove padding to align fully left
    }
}



struct ProductivitySleepView_Previews: PreviewProvider {
    static var previews: some View {
        ProductivitySleepView()
    }
}

