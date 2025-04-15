//
//  FocusView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/23/24.
//
import SwiftUI

struct FocusView: View {
    @State private var timerMinutes: Double = 1 // Default timer duration in minutes
    @State private var timerRunning = false // State for running or stopping the timer

    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                        Text("Focus")
                            .font(.system(size: 28, weight: .bold))
                            .padding(.top, 20)
                            .padding()
                        
                        Image("TTLogo1")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .padding(.bottom, -20)
                            .padding(.trailing, -40)
                }
                
                
                Spacer()
                
                // Duration Input
                VStack {
                    Text("Make switch button here")
                        .font(.headline)
                    TextField("Minutes", value: $timerMinutes, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .keyboardType(.numberPad)
//                        .frame(width: 100)
//                        .padding(.bottom, 20)
                }
                
                CircleTimerView(timerDuration: timerMinutes * 60, isRunning: $timerRunning)
                
                // Start/Stop Button
                Button(action: {
                    timerRunning.toggle() // Start or stop the timer
                }) {
                    Text(timerRunning ? "Stop" : "Start")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(width: 120, height: 50)
                        .background(timerRunning ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct CircleTimerView: View {
    @State private var timerProgress: CGFloat = 0.0
    @State private var isHalfway = false
    @State private var currentTime: Double = 0
    let timerDuration: Double
    @Binding var isRunning: Bool

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.gray)
            
            Circle()
                .trim(from: 0.0, to: timerProgress)
                .stroke(isHalfway ? Color.red : Color.blue, lineWidth: 20)
                .rotationEffect(.degrees(-90))
                .animation(.linear(duration: timerDuration), value: timerProgress)
            
            Text(formatTime(currentTime))
                .font(.largeTitle)
                .bold()
        }
        .frame(width: 200, height: 200)
        .padding(40)
        .onAppear {
            currentTime = timerDuration
        }
        .onChange(of: isRunning) { running in
            if running {
                startTimer()
            } else {
                resetTimer()
            }
        }
    }

    func startTimer() {
        timerProgress = 0.0
        isHalfway = false
        currentTime = timerDuration
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if isRunning {
                if currentTime > 0 {
                    currentTime -= 0.1
                    timerProgress = CGFloat(1 - currentTime / timerDuration)
                    
                    if timerProgress >= 0.5 {
                        isHalfway = true
                    }
                } else {
                    timer.invalidate()
                    isRunning = false
                }
            } else {
                timer.invalidate()
            }
        }
    }

    func resetTimer() {
        timerProgress = 0.0
        currentTime = timerDuration
        isHalfway = false
    }

    func formatTime(_ seconds: Double) -> String {
        let minutes = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    FocusView()
}
