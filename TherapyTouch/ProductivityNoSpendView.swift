//
//  ProductivityNoSpendView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityNoSpendView: View {
    @State private var selectedMonth: Date = Date()
    @State private var saveTracking: [Date: Bool] = [:]

    private let calendar = Calendar.current

    private func generateDaysInMonth(for date: Date) -> [Date] {
        guard let range = calendar.range(of: .day, in: .month, for: date),
              let monthStart = calendar.date(from: calendar.dateComponents([.year, .month], from: date)) else {
            return []
        }

        return range.compactMap { day -> Date? in
            calendar.date(byAdding: .day, value: day - 1, to: monthStart)
        }
    }

    private func backgroundColor(for date: Date) -> Color {
        let saved = saveTracking[date] ?? false
        let isFuture = date > Date()

        if isFuture {
            return Color.gray.opacity(0.2)
        } else if saved {
            return Color.green.opacity(0.5)
        } else {
            return Color.gray.opacity(0.3)
        }
    }

    var body: some View {
            VStack {
                Text("No Spend")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 10)

                Text("Save any money today?")
                    .font(.system(size: 18))
                    .padding(.top, 5)


                Image("PiggyBank")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 150)
                    .padding(.bottom, 10)

                Text("Total amount saved: XX")
                    .font(.system(size: 18, weight: .bold))
                
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

                Spacer()
                
                Text("This month:")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 15)

                HStack {
                    Button(action: {
                        if let previousMonth = calendar.date(byAdding: .month, value: -1, to: selectedMonth) {
                            selectedMonth = previousMonth
                        }
                    }) {
                        Image(systemName: "chevron.left")
                    }

                    Text("\(selectedMonth, formatter: monthFormatter)")
                        .font(.title3.bold())
                        .padding(.horizontal)

                    Button(action: {
                        if let nextMonth = calendar.date(byAdding: .month, value: 1, to: selectedMonth) {
                            selectedMonth = nextMonth
                        }
                    }) {
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(.top, 5)

                let daysInMonth = generateDaysInMonth(for: selectedMonth)

                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 7), spacing: 7) {
                    ForEach(daysInMonth, id: \.self) { date in
                        Text("\(calendar.component(.day, from: date))")
                            .frame(width: 28, height: 28)
                            .cornerRadius(5)
                            .background(backgroundColor(for: date))
                            .onTapGesture {
                                if date <= Date() {
                                    saveTracking[date]?.toggle()
                                }
                            }
                    }
                }
                .padding(.bottom, 75)
                .padding(.top, 5)
                .padding(.horizontal)
            }
        }
    }

    private var monthFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }

#Preview {
    ProductivityNoSpendView()
}
