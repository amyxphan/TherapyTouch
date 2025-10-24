//
//  ProductivityStepView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 4/28/25.
//

import SwiftUI

struct StepDay: Identifiable {
    let id = UUID()
    let date: Date
    var stepsWalked: Int = 0
    var isSelected: Bool = false
}

struct ProductivityStepView: View {
    @State private var stepDays: [Date: StepDay] = [:]
    @State private var selectedMonth: Date = Date()
    @State private var inputSteps: String = ""  // This stores the user input as a String
    @State private var totalStepsToday: Int = 0
    
    private let calendar = Calendar.current

    private func generateDaysInMonth(for date: Date) -> [Date] {
        guard let range = calendar.range(of: .day, in: .month, for: date),
              let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date)) else {
            return []
        }
        
        return range.compactMap { day in
            calendar.date(byAdding: .day, value: day - 1, to: startOfMonth)
        }
    }
    
    private func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Steps")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                
                Text("Did you reach your step goal?")
                    .font(.system(size: 20))
                    .padding(.bottom, 10)
                
                Image("Steps")
                    .resizable()
                    .frame(maxWidth: 110, maxHeight: 130)
                    .padding(.bottom, 10)
                
                TextField("Enter steps", text: $inputSteps)
                    .padding(8)
                    .border(Color(.lightGray))
                    .cornerRadius(5)
                
                // 🟤 UPDATED SUBMIT BUTTON
                Button(action: {
                    guard let steps = Int(inputSteps), steps >= 0 else { return }
                    
                    let today = calendar.startOfDay(for: Date())
                    var day = stepDays[today] ?? StepDay(date: today)
                    day.stepsWalked += steps
                    stepDays[today] = day
                    totalStepsToday = day.stepsWalked
                    
                    // Reset the input field
                    inputSteps = ""
                    
                    // 🕒 Save timestamp and value for latest steps submission
                    let timestamp = Date()
                    UserDefaults.standard.set(timestamp, forKey: "lastStepsSubmissionTime")
                    UserDefaults.standard.set(totalStepsToday, forKey: "lastStepsSubmissionValue")
                }) {
                    Text("Submit")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }
                .background(Color(hex: "#B89D6A"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.top)
                
                Text("Total steps logged today: \(totalStepsToday) steps")
                    .font(.system(size: 18))
                    .padding(.top, 2)
                
                Spacer()
                
                Text("This month:")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 15)
                
                // Month Navigation Header
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
                .padding()
                
                let days = generateDaysInMonth(for: selectedMonth)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 7), spacing: 10) {
                    ForEach(days, id: \.self) { date in
                        let day = calendar.component(.day, from: date)
                        let isFuture = date > Date()
                        
                        let dayData = stepDays[date] ?? StepDay(date: date, stepsWalked: 0)
                        let steps = dayData.stepsWalked
                        let bgColor = isFuture
                        ? Color.gray.opacity(0.2)
                        : stepColor(for: steps)
                        
                        Text("\(day)")
                            .frame(width: 28, height: 28)
                            .background(bgColor)
                            .cornerRadius(5)
                            .onTapGesture {
                                if !isFuture {
                                    var updated = dayData
                                    updated.isSelected.toggle()
                                    stepDays[date] = updated
                                }
                            }
                    }
                }
                .padding()
            }
            .padding(.bottom, 125)
            .padding(.top, 5)
            .padding(.horizontal)
        }
    }
    
    func stepColor(for steps: Int) -> Color {
        let percentage = min(Double(steps) / 10000.0, 1.0)
        return Color.green.opacity(0.3 + 0.7 * percentage)
    }
}

#Preview {
    ProductivityStepView()
}

