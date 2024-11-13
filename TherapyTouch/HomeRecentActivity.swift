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
        HStack {
            VStack(alignment: .leading) {
                Text(category)
                    .font(.system(size: 18, weight: .bold))
                    .padding(.leading, 8)
                    .padding(.bottom, 2)
                    .foregroundColor(.black)
                
                Text("submitted at \(submition)")
                    .font(.system(size: 14))
                    .padding(.leading, 8)
                    .italic()
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack {
                Text("\(data)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
            }
            .frame(maxHeight: 90)
            .padding(.trailing, 8)
        }
        .frame(maxWidth: 375, alignment: .leading)
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

