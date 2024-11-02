//
//  ProductivityNewView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/1/24.
//

import SwiftUI

struct ProductivityNewView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Add another goal")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("New Goal Page")
                Spacer()
            }
        }
    }
}

#Preview {
    ProductivityNewView()
}
