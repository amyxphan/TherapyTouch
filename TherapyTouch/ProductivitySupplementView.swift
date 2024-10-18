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
                Text("Supplements")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("Supplements Page")
                Spacer()
            }
        }
    }
}

#Preview {
    ProductivitySupplementView()
}

