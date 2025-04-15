import SwiftUI

struct stepsDay: Identifiable {
    let id = UUID()
    let dayNumber: Int
    var stepsWalked: Int = 0
    var isSelected: Bool
}

struct ProductivityStepsView: View {
    @State private var days: [stepsDay] = (1...30).map {
        stepsDay(dayNumber: $0, stepsWalked: Int.random(in: 0...10000), isSelected: false)
    }
    
    // Get today's day of the month (e.g., 14)
    private var currentDayOfMonth: Int {
        Calendar.current.component(.day, from: Date())
    }

    var body: some View {
        ScrollView {
            VStack {
                Text("Steps")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                
                Spacer()
                
                Text("Did you reach your step goal?")
                    .font(.system(size: 20))
                    .padding(.bottom, 10)
                
                Spacer()
                
                NavigationLink(destination: ProductivityStepsView()) {
                    Text("Add/Update Goal")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }
                .background(Color(hex: "#B89D6A"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 10)
                
                Image("Steps")
                    .resizable()
                    .frame(maxWidth: 130, maxHeight: 150)
                    .padding(.bottom, 10)
                
                Text("Current Count: XX")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                Text("Current Goal: XX")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
            }
            
            Text("This month:")
                .font(.system(size: 22, weight: .bold))
                .padding(.top, 10)
            
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 7), spacing: 10) {
                    ForEach($days) { $day in
                        Text("\(day.dayNumber)")
                            .frame(width: 40, height: 40)
                            .background(day.dayNumber <= currentDayOfMonth
                                        ? stepColor(for: day.stepsWalked)
                                        : Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            .onTapGesture {
                                if day.dayNumber <= currentDayOfMonth {
                                    day.isSelected.toggle()
                                }
                            }
                    }
                }
                .padding()
            }
            .padding(.bottom, 150)
        }
    }

    // Maps steps walked to a darker green color based on percentage toward 10,000 steps
    func stepColor(for steps: Int) -> Color {
        let percentage = min(Double(steps) / 10000.0, 1.0)
        return Color.green.opacity(0.3 + 0.7 * percentage)
    }
}
