//
//  HomeRecentActivity.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/11/24.
//

import SwiftUI

struct HomeRecentActivity: View {
    var category: String = "Category"
    var submition: Int = 12
    var data: String = "DATA"

    var body: some View {
            VStack(alignment: .leading) {
                Text(category)
                    .font(.system(size: 18, weight: .bold))
                    .padding(.leading, 8)
                    .foregroundColor(.black)
                
                Text("submitted at \(submition)")
                    .font(.system(size: 16))
                    .padding(.leading, 8)
                    .italic()
                    .foregroundColor(.black)
                ZStack {
                    Text("\(data)")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.leading, 8)
                        .foregroundColor(.black)
                }
            }
            .frame(maxWidth: 375)
            .background(Color(hex: "#F0DFBE"))
            .cornerRadius(5)
            .buttonBorderShape(.roundedRectangle)
            .padding(.bottom, 5)
        }
}

struct HomeRecentActivity_Previews: PreviewProvider {
    static var previews: some View {
        HomeRecentActivity()
    }
}

