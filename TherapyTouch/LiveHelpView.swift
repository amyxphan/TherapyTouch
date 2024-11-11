//
//  LiveHelpView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/23/24.
//
import SwiftUI

struct LiveHelpView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        Text("Let's Talk!")
                            .font(.system(size: 28, weight: .bold))
                            .padding(.top, 25)
                            .padding(.bottom, 15)
                        Spacer()
                    }
                    Text("Appointments:")
                        .font(.system(size: 22))
                        .padding(.leading, 15)
                    HStack(alignment: .center) {
                        Spacer()
                        Button(action: {
                            // Button action here
                        }, label: {
                            Text("Book an appointment")
                                .font(.system(size: 22, weight: .bold))
                                .frame(maxWidth: 150)
                                .padding(.vertical, 12)
                                .padding(.horizontal)
                                .foregroundColor(.black)
                        })
                        .background(Color(hex: "#F0DFBE"))
                        .cornerRadius(5)
                        .buttonBorderShape(.roundedRectangle)
                        
                        Button(action: {
                            // Button action here
                        }, label: {
                            Text("Cancel an appointment")
                                .font(.system(size: 22, weight: .bold))
                                .frame(maxWidth: 150)
                                .padding(.vertical, 12)
                                .padding(.horizontal)
                                .foregroundColor(.black)
                        })
                        .background(Color(hex: "#F0DFBE"))
                        .cornerRadius(5)
                        .buttonBorderShape(.roundedRectangle)
                        Spacer()
                    }
                    .padding(.bottom, 5)
                    
                    Text("Get live help:")
                        .font(.system(size: 22))
                        .padding(.leading, 15)
                    VStack {
                        Button(action: {
                            // Button action here
                        }, label: {
                            VStack(alignment: .leading) {
                                Text("Jane Doe")
                                    .font(.system(size: 18, weight: .bold))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                Text("Job Description")
                                    .font(.system(size: 16))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                Text("Available Now")
                                    .font(.system(size: 16, weight: .bold))
                                    .italic()
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                HStack {
                                    Button(action: {
                                        // action here
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
                                        // action here
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
                                        // action here
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
                        
                        Button(action: {
                            // Button action here
                        }, label: {
                            VStack(alignment: .leading) {
                                Text("Jane Doe")
                                    .font(.system(size: 18, weight: .bold))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                Text("Job Description")
                                    .font(.system(size: 16))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                Text("Available Now")
                                    .font(.system(size: 16, weight: .bold))
                                    .italic()
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                HStack {
                                    Button(action: {
                                        // action here
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
                                        // action here
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
                                        // action here
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
                        
                        Button(action: {
                            // Button action here
                        }, label: {
                            VStack(alignment: .leading) {
                                Text("Jane Doe")
                                    .font(.system(size: 18, weight: .bold))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                Text("Job Description")
                                    .font(.system(size: 16))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                Text("Available Now")
                                    .font(.system(size: 16, weight: .bold))
                                    .italic()
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                HStack {
                                    Button(action: {
                                        // action here
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
                                        // action here
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
                                        // action here
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

                        Button(action: {
                            // Button action here
                        }, label: {
                            VStack(alignment: .leading) {
                                Text("Jane Doe")
                                    .font(.system(size: 18, weight: .bold))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                Text("Job Description")
                                    .font(.system(size: 16))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                Text("Available Now")
                                    .font(.system(size: 16, weight: .bold))
                                    .italic()
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                                HStack {
                                    Button(action: {
                                        // action here
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
                                        // action here
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
                                        // action here
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
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    LiveHelpView()
}
