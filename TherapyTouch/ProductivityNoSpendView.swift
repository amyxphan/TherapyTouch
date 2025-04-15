//
//  ProductivityNoSpendView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct MoneyDay: Identifiable {
    let id = UUID()
    let dayNumber: Int
    var didSaveMoney: Bool = false
    var isSelected: Bool
}

struct ProductivityNoSpendView: View {
    @State private var days: [MoneyDay] = (1...30).map {
        MoneyDay(dayNumber: $0, didSaveMoney: Bool.random(), isSelected: false)
    }
    
    private var currentDayOfMonth: Int {
        Calendar.current.component(.day, from: Date())
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("No Spend")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                
                Spacer()
                
                Text("Save any money today?")
                    .font(.system(size: 20))
                    .padding(.bottom, 10)
                
                Spacer()
                
                NavigationLink(destination: ProductivityNoSpendView()) {
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
                
                Image("PiggyBank")
                    .resizable()
                    .frame(maxWidth: 250, maxHeight: 200)
                    .padding(.bottom, 10)
                
                Text("Total amount saved: XX")
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
                            .background(backgroundColor(for: day))
                            .cornerRadius(5)
                            .onTapGesture {
                                if day.dayNumber <= currentDayOfMonth {
                                    day.didSaveMoney.toggle()
                                }
                            }
                    }
                }
                .padding()
            }
            .padding(.bottom, 150)
        }
    }

    func backgroundColor(for day: MoneyDay) -> Color {
        if day.dayNumber > currentDayOfMonth {
            return Color.gray.opacity(0.2)
        } else if day.didSaveMoney {
            return Color.green
        } else {
            return Color.gray.opacity(0.3)
        }
    }
}
