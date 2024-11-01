//
//  ProductivityWeatherView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityWeatherView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Weather")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("Weather Page")
                Spacer()
            }
        }
    }
}

#Preview {
    ProductivityWeatherView()
}

