import SwiftUI

struct ProfileButton: View {
    var name: String = "Jane Doe"
    var jobDescription: String = "Job Description"
    var availability: String = "Available Now"
    
    // Alert states
    @State private var showMessageAlert = false
    @State private var showPhoneAlert = false
    @State private var showVideoAlert = false

    var body: some View {
        Button(action: {
            // Main button action if needed
        }, label: {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 18, weight: .bold))
                    .padding(.leading, 8)
                    .foregroundColor(.black)
                
                Text(jobDescription)
                    .font(.system(size: 16))
                    .padding(.leading, 8)
                    .foregroundColor(.black)
                
                Text(availability)
                    .font(.system(size: 16, weight: .bold))
                    .italic()
                    .padding(.leading, 8)
                    .foregroundColor(.black)
                
                HStack {
                    // Message button
                    Button(action: { showMessageAlert = true }, label: {
                        Image(systemName: "message")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color(hex: "#B89D6A"))
                            .clipShape(Circle())
                    })
                    .padding(.bottom, 4)
                    .padding(.leading, 6)
                    .alert("Open Messages?", isPresented: $showMessageAlert) {
                        Button("Cancel", role: .cancel) {}
                        Button("Proceed") {
                            // Add Messages app action if desired
                        }
                    } message: {
                        Text("You will switch to the Messages app to communicate with \(name).")
                    }
                    
                    // Phone button
                    Button(action: { showPhoneAlert = true }, label: {
                        Image(systemName: "phone")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color(hex: "#B89D6A"))
                            .clipShape(Circle())
                    })
                    .padding(.bottom, 4)
                    .padding(.leading, 6)
                    .alert("Open Phone?", isPresented: $showPhoneAlert) {
                        Button("Cancel", role: .cancel) {}
                        Button("Proceed") {
                            if let url = URL(string: "tel://1234567890") {
                                UIApplication.shared.open(url)
                            }
                        }
                    } message: {
                        Text("You will switch to the Phone app to call \(name).")
                    }
                    
                    // Video button
                    Button(action: { showVideoAlert = true }, label: {
                        Image(systemName: "video")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(hex: "#B89D6A"))
                            .clipShape(Circle())
                    })
                    .padding(.bottom, 4)
                    .padding(.leading, 4)
                    .alert("Open FaceTime?", isPresented: $showVideoAlert) {
                        Button("Cancel", role: .cancel) {}
                        Button("Proceed") {
                            if let url = URL(string: "facetime://1234567890") {
                                UIApplication.shared.open(url)
                            }
                        }
                    } message: {
                        Text("You will switch to FaceTime to call \(name).")
                    }
                }
            }
            
            Image(systemName: "person")
                .font(.system(size: 75))
                .foregroundColor(.black)
                .padding(10)
                .background(Color.white)
                .clipShape(Circle())
                .padding()
                .padding(.leading, 50)
                .frame(maxWidth: 170)
        })
        .background(Color(hex: "#F0DFBE"))
        .cornerRadius(5)
        .buttonBorderShape(.roundedRectangle)
        .padding(.bottom, 5)
    }
}

struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButton()
    }
}
