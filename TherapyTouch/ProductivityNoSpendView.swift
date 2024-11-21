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
                Text("Save any money today?")
                    .font(.system(size: 20))
                    .padding(.bottom, 10)
                Spacer()
                NavigationLink(destination: ProductivityNoSpendView()) {
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
                
                Image("PiggyBank")
                    .resizable()
                    .frame(maxWidth: 275, maxHeight: 225)
                    .padding(.bottom, 50)
                
                Text("Total amount saved: XX")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
            }
        }
    }
}

#Preview {
    ProductivityNoSpendView()
}

