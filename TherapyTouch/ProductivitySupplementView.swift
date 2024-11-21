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
                Text("Did you reach your step goal?")
                    .font(.system(size: 20))
                    .padding(.bottom, 10)
                Spacer()
                NavigationLink(destination: ProductivityStepsView()) {
                    Text("Add/Update Goal")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }
                .background(Color(hex: "#B89D6A"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 50)
                Image("Steps")
                    .resizable()
                    .frame(maxWidth: 170, maxHeight: 250)
                    .padding(.bottom, 50)
                
                Text("Current Count: XX")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
                Text("Current Goal: XX")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
            }
        }
    }
}

#Preview {
    ProductivityStepsView()
}

