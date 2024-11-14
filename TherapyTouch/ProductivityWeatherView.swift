//
//  ProductivityWeatherView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 10/17/24.
//

import SwiftUI

struct ProductivityWeatherView: View {
    var body: some View {
        VStack {
            Text("Weather")
                .font(.system(size: 28, weight: .bold))
                .padding(.top, 20)
            
            Text("How's the weather today?")
                .font(.system(size: 20))
                .padding(.top, 20)
            
            HStack { // add weather icons here NEED TO DRAW
//                Image("Mood1")
//                    .resizable()
//                    .frame(width: 60, height: 60)
//                    .onTapGesture {
//                        //update calendar
//                    }
            }
            
            Text("This month:")
                .font(.system(size: 22, weight: .bold))
                .padding(.top, 40)
            
            Spacer()
            
            //add a monthly tracker here
        }    }
}

#Preview {
    ProductivityWeatherView()
}

