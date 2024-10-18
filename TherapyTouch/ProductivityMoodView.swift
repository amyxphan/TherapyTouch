//
//  ProductivityMoodView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityMoodView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Mood")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("Mood Page")
                Spacer()
            }
        }
    }
}

#Preview {
    ProductivityMoodView()
}
