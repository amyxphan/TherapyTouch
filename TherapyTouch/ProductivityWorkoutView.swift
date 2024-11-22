//
//  ProductivityWorkoutView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityWorkoutView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Workout")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("Did you workout today?")
                Spacer()
                
                NavigationLink(destination: ProductivityWorkoutView()) {
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
                
                Button(action: {
                    // Phone action here
                }, label: {
                    Image("Workout")
                    // update picutre
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color(hex: "#B89D6A"))
                        .clipShape(Circle())
                })
                .padding(.bottom, 4)
                .padding(.leading, 6)
                
                Text("XX minutes")
                Spacer()
                
                Text("Current Goal")
                Spacer()
                
                Text("This month:")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top, 40)
                
                Spacer()
               
                //add a monthly tracker here
            }
        }
    }
}

#Preview {
    ProductivityWorkoutView()
}
