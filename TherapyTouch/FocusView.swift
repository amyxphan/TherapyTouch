//
//  FocusView.swift
//  TherapyTouch
//
//  Created by Amy Phan on 9/23/24.
//
import SwiftUI
import AVFoundation

struct FocusView: View {
    @State private var timerDuration: Double = 1500 // Default: 25 min
    @State private var currentTime: Double = 1500
    @State private var timerRunning = false
    @State private var selectedPreset: String = "25/5"
    @State private var isFocusPhase = true
    @State private var showAlert = false

    @State private var timer: Timer? = nil
    @State private var isHalfway = false
    @State private var timerProgress: CGFloat = 0.0

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
                        selectedPreset = "50/10"
                        resetTimer(isFocus: true, minutes: 50)
                    }) {
                        Text("50/10")
                            .padding()
                            .frame(width: 100)
                            .background(selectedPreset == "50/10" ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    Button(action: {
                        selectedPreset = "25/5"
                        resetTimer(isFocus: true, minutes: 25)
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

                CircleTimerView(
                    timerProgress: timerProgress,
                    timeText: formatTime(currentTime),
                    isFocusPhase: isFocusPhase,
                    isHalfway: isHalfway
                )

                Button(action: {
                    timerRunning.toggle()
                    if timerRunning {
                        startTimer()
                    } else {
                        stopTimer()
                    }
                }) {
                    Text(timerRunning ? "Stop" : "Start")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(width: 120, height: 50)
                        .background(timerRunning ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    let is50_10 = selectedPreset == "50/10"
                    let minutes = isFocusPhase ? (is50_10 ? 50 : 25) : (is50_10 ? 10 : 5)
                    resetTimer(isFocus: isFocusPhase, minutes: minutes)
                }) {
                    Text("Restart")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(width: 120, height: 50)
                        .background(timerRunning ? Color.gray : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Time's Up!"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    func resetTimer(isFocus: Bool, minutes: Int) {
        stopTimer()
        isFocusPhase = isFocus
        timerDuration = Double(minutes * 60)
        currentTime = timerDuration
        timerProgress = 0.0
        isHalfway = false
        timerRunning = false
    }

    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if currentTime > 0 {
                currentTime -= 0.1
                timerProgress = CGFloat(1 - currentTime / timerDuration)
                if timerProgress >= 0.5 {
                    isHalfway = true
                }
            } else {
                stopTimer()
                playSound()
                showAlert = true
                switchPhase()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func switchPhase() {
        isFocusPhase.toggle()

        let is50_10 = selectedPreset == "50/10"
        let nextDuration = isFocusPhase ? (is50_10 ? 50 : 25) : (is50_10 ? 10 : 5)
        resetTimer(isFocus: isFocusPhase, minutes: nextDuration)

        timerRunning = true
        startTimer()
    }

    func formatTime(_ seconds: Double) -> String {
        let minutes = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func playSound() {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "mp3") else {
            print("Sound file not found")
            return
        }
        var player: AVAudioPlayer?
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Failed to play sound: \(error.localizedDescription)")
        }
    }
}

struct CircleTimerView: View {
    var timerProgress: CGFloat
    var timeText: String
    var isFocusPhase: Bool
    var isHalfway: Bool

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
                .animation(.linear(duration: 0.1), value: timerProgress)

            VStack {
                Text(isFocusPhase ? "Time to focus!" : "Break time!")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                Text(timeText)
                    .font(.largeTitle)
                    .bold()
            }
        }
        .frame(width: 250, height: 250)
        .padding(40)
    }
}

#Preview {
    FocusView()
}
