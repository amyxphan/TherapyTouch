//
//  ProductivityNoSpendView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityNoSpendView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("No Spend")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("No Spend Page")
                Spacer()
                Image("PiggyBank")
                    .resizable()
                    .frame(maxWidth: 275, maxHeight: 225)
            }
        }
    }
}

#Preview {
    ProductivityNoSpendView()
}

