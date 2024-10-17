//
//  FocusView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/23/24.
//
import SwiftUI

struct FocusView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Focus")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("Focus Page")
                Spacer()
            }
        }
    }
}

#Preview {
    FocusView()
}
