//
//  ContentView.swift
//  TimerTest
//
//  Created by Delstun McCray on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pomodoroModel: PromodoroModel
    var body: some View {
        Home()
            .environmentObject(pomodoroModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
