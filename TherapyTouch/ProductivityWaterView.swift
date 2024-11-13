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
                Text("Water")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                
                Text("Let's view our progress today:")
                    .font(.system(size: 20))
                    .padding(.top, 10)
                
                Image("Water\(currentImageIndex)")
                    .resizable()
                    .frame(width: 350, height: 450)
                    .padding(.top, 70)
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
                    .padding(.top, 10)
            }
        }
    }
}

#Preview {
    ProductivityWaterView()
}

