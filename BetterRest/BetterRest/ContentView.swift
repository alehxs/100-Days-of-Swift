//
//  ContentView.swift
//  BetterRest
//
//  Created by Alex on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var SleepAmount = 6.5
    
    var body: some View {
        Stepper("\(SleepAmount.formatted()) hours", value: $SleepAmount, in: 4...12, step: 0.45)
    }
}

#Preview {
    ContentView()
}
