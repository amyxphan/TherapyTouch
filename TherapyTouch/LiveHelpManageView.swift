//
//  LiveHelpManageView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/14/24.
//

import SwiftUI

struct LiveHelpManageView: View {
    var therapist: String = "Jane Doe"
    var description: String = "Job Description"

    var body: some View {
        ScrollView {
            Text("View my appointments")
                .font(.system(size: 28, weight: .bold))
                .padding(.top, 45)
                .padding(.bottom, 40)
            
            VStack (alignment: .leading){
                Text("Today:")
                    .font(.system(size: 18))
                    .padding(.leading, 5)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(therapist)
                            .font(.system(size: 20, weight: .bold))
                            .padding(.leading, 8)
                            .padding(.bottom, 2)
                            .foregroundColor(.black)
                        Text(description)
                            .font(.system(size: 18))
                            .padding(.leading, 8)
                            .padding(.bottom, 2)
                            .foregroundColor(.black)
                        
                    }
                    
                    Spacer()
                    
                    
                    VStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Join")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .buttonBorderShape(.roundedRectangle)
                                .padding(8)
                                .background(Color(hex: "#B89D6A"))
                                .cornerRadius(5)
                        })
                        .padding(.top, 10)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Cancel")
                                .font(.system(size: 18, weight: .bold))
                                .padding(8)
                                .foregroundColor(Color(hex: "#FF0000"))
                                .cornerRadius(5)
                        })
                        .padding(.bottom, 8)
                    }
                    .frame(maxHeight: 120)
                    .padding(.trailing, 10)
                }
                .frame(maxWidth: 375, alignment: .leading)
                .background(Color(hex: "#F0DFBE"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 5)
                
                Text("Tomorrow:")
                    .font(.system(size: 18))
                    .padding(.leading, 5)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(therapist)
                            .font(.system(size: 20, weight: .bold))
                            .padding(.leading, 8)
                            .padding(.bottom, 2)
                            .foregroundColor(.black)
                        Text(description)
                            .font(.system(size: 18))
                            .padding(.leading, 8)
                            .padding(.bottom, 2)
                            .foregroundColor(.black)
                        
                    }
                    
                    Spacer()
                    
                    
                    VStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Join")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .buttonBorderShape(.roundedRectangle)
                                .padding(8)
                                .background(Color(hex: "#B89D6A"))
                                .cornerRadius(5)
                        })
                        .padding(.top, 10)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Cancel")
                                .font(.system(size: 18, weight: .bold))
                                .padding(8)
                                .foregroundColor(Color(hex: "#FF0000"))
                                .cornerRadius(5)
                        })
                        .padding(.bottom, 8)
                    }
                    .frame(maxHeight: 120)
                    .padding(.trailing, 10)
                }
                .frame(maxWidth: 375, alignment: .leading)
                .background(Color(hex: "#F0DFBE"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 5)
                
                Text("Next Week:")
                    .font(.system(size: 18))
                    .padding(.leading, 5)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(therapist)
                            .font(.system(size: 20, weight: .bold))
                            .padding(.leading, 8)
                            .padding(.bottom, 2)
                            .foregroundColor(.black)
                        Text(description)
                            .font(.system(size: 18))
                            .padding(.leading, 8)
                            .padding(.bottom, 2)
                            .foregroundColor(.black)
                        
                    }
                    
                    Spacer()
                    
                    
                    VStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Join")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .buttonBorderShape(.roundedRectangle)
                                .padding(8)
                                .background(Color(hex: "#B89D6A"))
                                .cornerRadius(5)
                        })
                        .padding(.top, 10)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Cancel")
                                .font(.system(size: 18, weight: .bold))
                                .padding(8)
                                .foregroundColor(Color(hex: "#FF0000"))
                                .cornerRadius(5)
                        })
                        .padding(.bottom, 8)
                    }
                    .frame(maxHeight: 120)
                    .padding(.trailing, 10)
                }
                .frame(maxWidth: 375, alignment: .leading)
                .background(Color(hex: "#F0DFBE"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 5)
                    Spacer()
                
            }
        }
    }

}

struct LiveHelpManageView_Previews: PreviewProvider {
    static var previews: some View {
        LiveHelpManageView()
    }
}


