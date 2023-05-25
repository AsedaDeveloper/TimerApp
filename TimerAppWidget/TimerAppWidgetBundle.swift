//
//  TimerAppWidgetBundle.swift
//  TimerAppWidget
//
//  Created by Yooku Anamuah-Mensah on 25/05/2023.
//

import WidgetKit
import SwiftUI

@main
struct TimerAppWidgetBundle: WidgetBundle {
    var body: some Widget {
        TimerAppWidget()
        TimerAppWidgetLiveActivity()
    }
}
