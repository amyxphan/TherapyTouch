//
//  ProductivitySupplementView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivitySupplementView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Water")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("Water Page")
                Spacer()
            }
        }
    }
}

#Preview {
    ProductivitySupplementView()
}

