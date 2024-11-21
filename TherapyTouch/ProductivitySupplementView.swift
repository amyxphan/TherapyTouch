//
//  ProductivitySupplementView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityStepsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Steps")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("Steps Page")
                Spacer()
            }
        }
    }
}

#Preview {
    ProductivityStepsView()
}

