//
//  ContentView.swift
//  TimerApp
//
//  Created by Yooku Anamuah-Mensah on 20/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = Tab.time

    enum Tab {
        case time
        case alarm
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            TimeView()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("Time")
                }
                .tag(Tab.time)

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

struct TimeView: View {
    var body: some View {
        VStack {
            Image(systemName: "clock.fill")
                .font(.largeTitle)
            Text("Time View")
                .font(.title)
        }
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
