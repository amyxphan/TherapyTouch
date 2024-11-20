//
//  LiveHelpBookView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/14/24.
//

import SwiftUI

struct LiveHelpBookView: View {
    // Properties for dynamic content if needed
    var name: String = "Jane Doe"
    var jobDescription: String = "Job Description"
    var time: String = "ERR"

    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack () {
                Button(action: {
                    // Main button action here
                }, label: {
                    VStack(alignment: .leading) { // Wrap all elements in a single VStack
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text(name)
                                    .font(.system(size: 22, weight: .bold))
                                    .padding(.leading, 8)
                                    .padding(.top, 2)
                                    .foregroundColor(.black)
                                
                                Text(jobDescription)
                                    .font(.system(size: 15))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                HStack {
                                    Image(systemName: "message")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(6)
                                        .background(Color(hex: "#B89D6A"))
                                        .clipShape(Circle())
                                    
                                    Image(systemName: "phone")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(6)
                                        .background(Color(hex: "#B89D6A"))
                                        .clipShape(Circle())
                                    
                                    Image(systemName: "video")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(Color(hex: "#B89D6A"))
                                        .clipShape(Circle())
                                }
                                .padding(.leading, 8)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "person")
                                .font(.system(size: 75))
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color.white)
                                .clipShape(Circle())
                                .padding(.trailing, 5)
                                .padding(.top, 10)
                        }
                        .padding()

                        Text("Available Appointments:")
                            .font(.system(size: 18, weight: .bold))
                            .padding(.leading, 15)
                            .foregroundColor(.black)
                        
                        Text("Monday:")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .padding(.leading, 15)
                            .padding(.top, 5)
                        
                        HStack {
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                        }
                        .padding(.leading, 10)
                        .padding(.bottom)
                        
                        Text("Tuesday:")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .padding(.leading, 15)
                        
                        HStack {
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                        }
                        .padding(.leading, 10)
                        .padding(.bottom)
                        
                        Text("Wednesday:")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .padding(.leading, 15)
                        
                        HStack {
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                        }
                        .padding(.leading, 10)
                        .padding(.bottom)
                        
                        Text("Thursday:")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .padding(.leading, 15)
                        
                        HStack {
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                        }
                        .padding(.leading, 10)
                        .padding(.bottom)
                        
                        Text("Friday:")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .padding(.leading, 15)
                        
                        HStack {
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                        }
                        .padding(.leading, 10)
                        .padding(.bottom)
                    }
                })
                .background(Color(hex: "#F0DFBE"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 5)
                .padding(.leading, 20)
                .frame(maxWidth: 375)
                
                Button(action: {
                    // Main button action here
                }, label: {
                    VStack(alignment: .leading) { // Wrap all elements in a single VStack
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text(name)
                                    .font(.system(size: 22, weight: .bold))
                                    .padding(.leading, 8)
                                    .padding(.top, 2)
                                    .foregroundColor(.black)
                                
                                Text(jobDescription)
                                    .font(.system(size: 15))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                HStack {
                                    Image(systemName: "message")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(6)
                                        .background(Color(hex: "#B89D6A"))
                                        .clipShape(Circle())
                                    
                                    Image(systemName: "phone")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(6)
                                        .background(Color(hex: "#B89D6A"))
                                        .clipShape(Circle())
                                    
                                    Image(systemName: "video")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(Color(hex: "#B89D6A"))
                                        .clipShape(Circle())
                                }
                                .padding(.leading, 10)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "person")
                                .font(.system(size: 75))
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color.white)
                                .clipShape(Circle())
                                .padding(.trailing, 5)
                                .padding(.top, 10)
                        }
                        .padding()

                        Text("Available Appointments:")
                            .font(.system(size: 18, weight: .bold))
                            .padding(.leading, 15)
                            .foregroundColor(.black)
                        
                        Text("Monday:")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .padding(.leading, 15)
                            .padding(.top, 5)
                        
                        HStack {
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                        }
                        .padding(.leading, 10)
                        .padding(.bottom)
                        
                        Text("Tuesday:")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .padding(.leading, 15)
                        
                        HStack {
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                        }
                        .padding(.leading, 10)
                        .padding(.bottom)
                        
                        Text("Wednesday:")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .padding(.leading, 15)
                        
                        HStack {
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                        }
                        .padding(.leading, 10)
                        .padding(.bottom)
                        
                        Text("Thursday:")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .padding(.leading, 15)
                        
                        HStack {
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                        }
                        .padding(.leading, 10)
                        .padding(.bottom)
                        
                        Text("Friday:")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .padding(.leading, 15)
                        
                        HStack {
                            Button(action: {
                                // Main button action here
                            }, label: {
                                Text(time)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(hex: "#B89D6A"))
                                    .clipShape(Circle())
                            })
                        }
                        .padding(.leading, 10)
                        .padding(.bottom)
                    }
                })
                .background(Color(hex: "#F0DFBE"))
                .cornerRadius(5)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom, 5)
                .padding(.leading, 20)
                .frame(maxWidth: 375)
            }
        }
    }
}

struct LiveHelpBookView_Previews: PreviewProvider {
    static var previews: some View {
        LiveHelpBookView()
    }
}

