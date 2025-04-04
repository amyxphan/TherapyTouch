//
//  ProductivityWaterView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityWaterView: View {
    @State private var currentImageIndex = 5
    private let totalImages = 5

    var body: some View {
        ScrollView {
            VStack {
                Text("Hydration")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 20)
                
                Text("Let's view our progress today:")
                    .font(.system(size: 20))
                    .padding(.top, 10)
                
                Text("Current Goal: [User Input]")
                    .padding(.top, 10)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                
                NavigationLink(destination: ProductivityWaterView()) {
                    Text("Add/Update Goal")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }

                .background(Color(hex: "#B89D6A"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                
                Image("Water\(currentImageIndex)")
                    .resizable()
                    .frame(width: 225, height: 325)
                    .padding(.top, 50)
                    .onTapGesture {
                        if currentImageIndex > 1 {
                            currentImageIndex -= 1
                        } else {
                            currentImageIndex = totalImages
                        }
                    }
                
                Spacer()
                
                Text("XX [unit of water intake]")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.top, 40)
            }
        }
    }
}

#Preview {
    ProductivityWaterView()
}

