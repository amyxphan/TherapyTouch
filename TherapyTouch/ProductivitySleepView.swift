//
//  ProductivitySleepView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivitySleepView: View {
    @State private var count: Int = 0
    private let sliderWidth: CGFloat = 300
    var body: some View {
        ScrollView {
            VStack {
                Text("Sleep")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                
                Spacer()

                ZStack {
                    Slider(
                        value: Binding(
                            get: { Double(count) },
                            set: { count = Int($0) }
                        ),
                        in: 0...24,
                        step: 1
                    )
                    .padding()

                   Image("Bed")
                        .resizable()
                        .frame(width: 50, height: 50)

               }
                
                Text("Hours of Sleep: \(count)")
                    .font(.title)
                    .padding()
                
                Spacer()
                
                Text("This month:")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top, 100)
            }
        }
    }
}

#Preview {
    ProductivitySleepView()
}
