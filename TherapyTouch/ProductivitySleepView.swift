//
//  ProductivitySleepView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivitySleepView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Sleep")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("Sleep Page")
                Spacer()
            }
        }
    }
}

#Preview {
    ProductivitySleepView()
}
