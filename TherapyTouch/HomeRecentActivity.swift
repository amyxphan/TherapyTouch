//
//  HomeRecentActivity.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/11/24.
//

import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    let category: String
    let data: String
    let submissionTime: Date
}

struct HomeRecentActivity: View {
    var category: String = "Category"
    var data: String = "DATA"
    var submissionTime: Date = Date()

    // Format date to "HH:MM AM/PM"
    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: submissionTime)
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(category)
                    .font(.system(size: 18))
                    .padding(.leading, 8)
                    .padding(.bottom, 2)
                    .foregroundColor(.black)
                
                Text("submitted at \(formattedTime)")
                    .font(.system(size: 14))
                    .padding(.leading, 8)
                    .italic()
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack {
                Text("\(data)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
            }
            .frame(maxHeight: 90)
            .padding(.trailing, 8)
        }
        .frame(maxWidth: 375, alignment: .leading)
        .background(Color(hex: "#F0DFBE"))
        .cornerRadius(5)
        .buttonBorderShape(.roundedRectangle)
        .padding(.bottom, 5)
    }
}

// MARK: - Helper to load top 3 recent activities
extension Array where Element == Activity {
    static func loadRecentActivities() -> [Activity] {
        var activities: [Activity] = []
        let defaults = UserDefaults.standard
        
        // Sleep
        if let sleepTime = defaults.object(forKey: "lastSleepSubmissionTime") as? Date {
            let sleepValue = defaults.integer(forKey: "lastSleepSubmissionValue")
            activities.append(Activity(category: "Sleep", data: "\(sleepValue) hrs", submissionTime: sleepTime))
        }
        
        // Water
        if let waterTime = defaults.object(forKey: "lastWaterSubmissionTime") as? Date {
            let waterValue = defaults.integer(forKey: "lastWaterSubmissionValue")
            activities.append(Activity(category: "Water", data: "\(waterValue) oz", submissionTime: waterTime))
        }
        
        // Steps
        if let stepsTime = defaults.object(forKey: "lastStepsSubmissionTime") as? Date {
            let stepsValue = defaults.integer(forKey: "lastStepsSubmissionValue")
            activities.append(Activity(category: "Steps", data: "\(stepsValue) steps", submissionTime: stepsTime))
        }
        
        // No Spend
        if let noSpendTime = UserDefaults.standard.object(forKey: "lastNoSpendSubmissionTime") as? Date {
            let noSpendValue = UserDefaults.standard.integer(forKey: "lastNoSpendSubmissionValue")
            activities.append(Activity(category: "No Spend", data: "$\(noSpendValue)", submissionTime: noSpendTime))
        }

        // Mood
        if let moodTime = UserDefaults.standard.object(forKey: "lastMoodSubmissionTime") as? Date {
            let moodValue = UserDefaults.standard.integer(forKey: "lastMoodSubmissionValue")
            
            // Map the mood number to a label
            let moodLabel: String
            switch moodValue {
            case 1: moodLabel = "Very Happy"
            case 2: moodLabel = "Happy"
            case 3: moodLabel = "Okay"
            case 4: moodLabel = "Sad"
            case 5: moodLabel = "Terrible"
            default: moodLabel = "Unknown"
            }
            
            activities.append(Activity(category: "Mood", data: moodLabel, submissionTime: moodTime))
        }

        // Workout
        if let workoutTime = UserDefaults.standard.object(forKey: "lastWorkoutSubmissionTime") as? Date {
            let workoutValue = UserDefaults.standard.integer(forKey: "lastWorkoutSubmissionValue")
            activities.append(Activity(category: "Workout", data: "\(workoutValue) min", submissionTime: workoutTime))
        }

        
        return activities.sorted { $0.submissionTime > $1.submissionTime }.prefix(3).map { $0 }
    }
}

struct HomeRecentActivity_Previews: PreviewProvider {
    static var previews: some View {
        HomeRecentActivity(category: "Workout", data: "30 min", submissionTime: Date())
    }
}
