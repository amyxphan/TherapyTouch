//
//  FocusView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/23/24.
//
import SwiftUI
import AVFoundation
import UserNotifications

struct FocusView: View {
    @State private var timerDuration: Double = 1500 // Default 25 min
    @State private var timerRunning = false
    @State private var selectedPreset: String = "25/5"
    @State private var isFocusPhase = true
    @State private var showAlert = false

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

                Text("Pomodoro Timer!")
                    .font(.system(size: 20))
                    .padding(.bottom, 10)
                    .padding(.top, 25)

                HStack(spacing: 20) {
                    Button(action: {
                        timerDuration = 50 * 60
                        selectedPreset = "50/10"
                        isFocusPhase = true
                        timerRunning = false
                    }) {
                        Text("50/10")
                            .padding()
                            .frame(width: 100)
                            .background(selectedPreset == "50/10" ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    Button(action: {
                        timerDuration = 25 * 60
                        selectedPreset = "25/5"
                        isFocusPhase = true
                        timerRunning = false
                    }) {
                        Text("25/5")
                            .padding()
                            .frame(width: 100)
                            .background(selectedPreset == "25/5" ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 20)

                let duration = timerDuration

                CircleTimerView(
                    timerDuration: duration,
                    isRunning: $timerRunning,
                    isFocusPhase: $isFocusPhase,
                    showAlert: $showAlert
                )

                Button(action: {
                    timerRunning.toggle()
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
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Time's up!"),
                      message: Text(isFocusPhase ? "Take a break!" : "Time to focus!"),
                      dismissButton: .default(Text("OK")))
            }
        }
        .onAppear {
            requestNotificationPermission()
        }
    }

    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in }
    }

    func playSound() {
        AudioServicesPlaySystemSound(SystemSoundID(1005)) // Tri-tone
    }
}

struct CircleTimerView: View {
    @State private var timerProgress: CGFloat = 0.0
    @State private var isHalfway = false
    @State private var currentTime: Double = 0
    let timerDuration: Double
    @Binding var isRunning: Bool
    @Binding var isFocusPhase: Bool
    @Binding var showAlert: Bool

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

            VStack {
                Text(formatTime(currentTime))
                    .font(.largeTitle)
                    .bold()

                Text(isFocusPhase ? "Time to focus!" : "Break time")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 220, height: 220)
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
                    showAlert = true
                    AudioServicesPlaySystemSound(SystemSoundID(1005)) // play sound

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        switchPhase()
                    }
                }
            } else {
                timer.invalidate()
            }
        }
    }

    func switchPhase() {
        isFocusPhase.toggle()

        let is50_10 = selectedPreset == "50/10"
        var nextDuration: Double

        if isFocusPhase {
            nextDuration = is50_10 ? 50 * 60 : 25 * 60
        } else {
            nextDuration = is50_10 ? 10 * 60 : 5 * 60
        }

        currentTime = nextDuration
        isRunning = true
        startTimer()
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

    private var selectedPreset: String {
        return isFocusPhase ? "focus" : "break"
    }
}

#Preview {
    FocusView()
}
