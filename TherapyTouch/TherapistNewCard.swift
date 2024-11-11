import SwiftUI

struct ProfileButton: View {
    // Properties for dynamic content if needed
    var name: String = "Jane Doe"
    var jobDescription: String = "Job Description"
    var availability: String = "Available Now"

    var body: some View {
        Button(action: {
            // Main button action here
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
                    Button(action: {
                        // Message action here
                    }, label: {
                        Image(systemName: "message")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color(hex: "#B89D6A"))
                            .clipShape(Circle())
                    })
                    .padding(.bottom, 4)
                    .padding(.leading, 6)
                    
                    Button(action: {
                        // Phone action here
                    }, label: {
                        Image(systemName: "phone")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color(hex: "#B89D6A"))
                            .clipShape(Circle())
                    })
                    .padding(.bottom, 4)
                    .padding(.leading, 6)
                    
                    Button(action: {
                        // Video action here
                    }, label: {
                        Image(systemName: "video")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(hex: "#B89D6A"))
                            .clipShape(Circle())
                    })
                    .padding(.bottom, 4)
                    .padding(.leading, 4)
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

