//
//  ContentView.swift
//  BetterRest
//
//  Created by Alex on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        Text("hey")
    }

    
}

#Preview {
    ContentView()
}


///Basic introduction to stepper picker
//@State private var SleepAmount = 6.5
//
//var body: some View {
//    Stepper("\(SleepAmount.formatted()) hours",  $SleepAmount, in: 4...12, step: 0.45) // Stepper uses + or - to inc or dec value
//}

///Introduction to date pickers and some properites

//struct ContentView: View {
//    @State private var wakeUp = Date.now
//    
//    var body: some View {
//        DatePicker("Please enter a date", selection: $wakeUp, in: ...Date.now)
//            .padding()
//            .labelsHidden()
//    }
//    func exampleDates() {
//        let tomorrow = Date.now.addingTimeInterval(86400)
//        let range = Date.now...tomorrow
//    }
//}

///Date formatting and how to make working with dates easier

//struct ContentView: View {
//    
//    
//    var body: some View {
////        Text(Date.now, format: .dateTime.day().month().year())
//        Text(Date.now.formatted(date: .abbreviated, time: .shortened))
//    }
//    
//    func exampleDates(){
////        var components = DateComponents()
////        components.hour = 8
////        components.minute = 0
////        let date = Calendar.current.date(from: components) ?? .now
//        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
//    }
//    
//}
