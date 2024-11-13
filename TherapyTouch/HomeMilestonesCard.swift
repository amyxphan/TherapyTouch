//
//  HomeMilestonesCard.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/13/24.
//


import SwiftUI

struct HomeMilestonesCard: View {
    var category: String = "Category"
    var data: String = "DATA"

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(category)
                    .font(.system(size: 18))
                    .padding(.leading, 8)
                    .padding(.bottom, 2)
                    .foregroundColor(.black)
                
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

struct HomeMilestonesCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeMilestonesCard()
    }
}


