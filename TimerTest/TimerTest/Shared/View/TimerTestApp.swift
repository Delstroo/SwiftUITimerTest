//
//  TimerTestApp.swift
//  TimerTest
//
//  Created by Delstun McCray on 8/1/23.
//

import SwiftUI

@main
struct TimerTestApp: App {
    // MARK: - Since We're doing Background fetching Initializing here
    @StateObject var pomodoroModel: PromodoroModel = .init()
    // MARK: - Scene Phase 
    @Environment(\.scenePhase) var phase
    // MARK: - Storing Last Time Stamp
    @State var lastActivetimeStamp: Date = Date()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pomodoroModel)
        }
        .onChange(of: phase) { newValue in
            if pomodoroModel.isStarted {
                if newValue == .background {
                    lastActivetimeStamp = Date()
                }
                if  newValue == .active {
                    // MARK: - Finding the difference
                    let currentTimeStampDifference = Date().timeIntervalSince(lastActivetimeStamp)
                    if pomodoroModel.totalSeconds - Int(currentTimeStampDifference) <= 0 {
                        pomodoroModel.isStarted = false
                        pomodoroModel.totalSeconds = 0
                        pomodoroModel.isFinished = true
                    } else { 
                        pomodoroModel.totalSeconds -= Int(currentTimeStampDifference)
                    }
                }
            }
        }
    }
}
