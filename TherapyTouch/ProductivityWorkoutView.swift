//
//  ProductivityWorkoutView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct WorkoutDay: Identifiable {
    let id = UUID()
    let date: Date
    var didWorkout: Bool = false
}

struct ProductivityWorkoutView: View {
    @State private var workoutDays: [Date: Bool] = [:] // Stores workout data for each date
    @State private var selectedMonth: Date = Date()

    private let calendar = Calendar.current

    // Generates all the days in the selected month
    private func generateDaysInMonth(for date: Date) -> [Date] {
        guard let range = calendar.range(of: .day, in: .month, for: date),
              let monthStart = calendar.date(from: calendar.dateComponents([.year, .month], from: date))
        else { return [] }

        return range.compactMap { day in
            calendar.date(byAdding: .day, value: day - 1, to: monthStart)
        }
    }

    // Formats date to "Month Year" string
    private func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }

    var body: some View {
        ScrollView {
            VStack {
                Text("Workout")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)

                Spacer()

                Text("Did you workout today?")

                Spacer()

                NavigationLink(destination: ProductivityWorkoutView()) {
                    Text("Add/Update Goal")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }
                .background(Color(hex: "#B89D6A"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 50)

                Button(action: {
                    // Phone action here
                }, label: {
                    Image("Workout")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color(hex: "#B89D6A"))
                        .clipShape(Circle())
                })
                .padding(.bottom, 4)
                .padding(.leading, 6)

                Text("XX minutes")

                Spacer()

                Text("Current Goal")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top, 10)
                
                Text("This month:")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top, 10)
                    .padding(.bottom, 15)

                Spacer()

                HStack {
                    Button(action: {
                        withAnimation {
                            selectedMonth = calendar.date(byAdding: .month, value: -1, to: selectedMonth) ?? selectedMonth
                        }
                    }) {
                        Image(systemName: "chevron.left")
                    }

                    Spacer()

                    Text(monthYearString(from: selectedMonth))
                        .font(.headline)

                    Spacer()

                    Button(action: {
                        withAnimation {
                            selectedMonth = calendar.date(byAdding: .month, value: 1, to: selectedMonth) ?? selectedMonth
                        }
                    }) {
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(.horizontal)

                VStack {
                    let days = generateDaysInMonth(for: selectedMonth)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 7), spacing: 10) {
                        ForEach(days, id: \.self) { date in
                            let day = calendar.component(.day, from: date)
                            let today = calendar.isDateInToday(date)
                            let didWorkout = workoutDays[date] ?? false

                            Text("\(day)")
                                .frame(width: 40, height: 40)
                                .background(
                                    date > Date() ? Color.gray.opacity(0.2) : (didWorkout ? Color.green : Color.gray.opacity(0.3))
                                )
                                .cornerRadius(5)
                                .onTapGesture {
                                    if date <= Date() {
                                        workoutDays[date] = !(workoutDays[date] ?? false)
                                    }
                                }
                        }
                    }
                    .padding()
                }
                .padding(.bottom, 150)
            }
        }
    }
}

#Preview {
    ProductivityWorkoutView()
}

