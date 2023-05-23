//
//  ContentView.swift
//  TimerApp
//
//  Created by Yooku Anamuah-Mensah on 20/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = Tab.timer

    enum Tab {
        case timer
        case alarm
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            TimerView()
                .tabItem {
                    Image(systemName: "timer")
                    Text("Time")
                }
                .tag(Tab.timer)

            AlarmView()
                .tabItem {
                    Image(systemName: "alarm.fill")
                    Text("Alarm")
                }
                .tag(Tab.alarm)
        }
        .accentColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerView: View {
    @State private var selectedHour = 0
    @State private var selectedMinute = 0
    @State private var selectedSecond = 0
    @State private var isTimerRunning = false

    let hours = Array(0...23)
    let minutes = Array(0...59)
    let seconds = Array(0...59)

    var body: some View {
        VStack {
            Image(systemName: "clock.fill")
                .font(.largeTitle)
            Text("Time View")
                .font(.title)

            HStack {
                Picker("Hours", selection: $selectedHour) {
                    ForEach(0..<hours.count) { index in
                        Text("\(hours[index]) hr")
                            .tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()

                Picker("Minutes", selection: $selectedMinute) {
                    ForEach(0..<minutes.count) { index in
                        Text("\(minutes[index]) min")
                            .tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()

                Picker("Seconds", selection: $selectedSecond) {
                    ForEach(0..<seconds.count) { index in
                        Text("\(seconds[index]) sec")
                            .tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
            }

            HStack(spacing: 20) { // Added spacing between buttons
                Button(action: {
                    cancelTimer()
                }) {
                    Text("Cancel")
                        .padding(20) // Increased padding
                        .background(Color.red)
                        .foregroundColor(.white)
                        .font(.headline)
                        .clipShape(Circle()) // Make the button round
                }
                .disabled(!isTimerRunning)

                Button(action: {
                    startTimer()
                }) {
                    Text("Start")
                        .padding(20) // Increased padding
                        .background(Color.green)
                        .foregroundColor(.white)
                        .font(.headline)
                        .clipShape(Circle()) // Make the button round
                }
            }
            .padding(.top, 20)
        }
    }

    func startTimer() {
        let selectedHours = hours[selectedHour]
        let selectedMinutes = minutes[selectedMinute]
        let selectedSeconds = seconds[selectedSecond]
        // Start the timer with the selected hours, minutes, and seconds
        print("Starting timer with \(selectedHours) hours, \(selectedMinutes) minutes, and \(selectedSeconds) seconds")
        // Add your timer logic here

        isTimerRunning = true
    }

    func cancelTimer() {
        // Cancel the timer
        print("Timer canceled")
        // Add your cancel timer logic here

        isTimerRunning = false
    }
}



struct AlarmView: View {
    var body: some View {
        VStack {
            Image(systemName: "alarm.fill")
                .font(.largeTitle)
            Text("Alarm View")
                .font(.title)
        }
    }
}

