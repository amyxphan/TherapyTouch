//
//  MilestonesNewView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/8/24.
//

import SwiftUI

struct MilestonesNewView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Add another milestone")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 45)
                Spacer()
                Text("New Milestone Page")
                Spacer()
            }
        }
    }
}

#Preview {
    MilestonesNewView()
}
