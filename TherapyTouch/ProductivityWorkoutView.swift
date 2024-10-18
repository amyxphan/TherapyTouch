//
//  ProductivityWorkoutView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityWorkoutView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Workout")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("Workout Page")
                Spacer()
            }
        }
    }
}

#Preview {
    ProductivityWorkoutView()
}
