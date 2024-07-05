//
//  ContentView.swift
//  BetterRest
//
//  Created by Alex on 7/3/24.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }

    var body: some View {
        NavigationStack{
            Form{
                VStack(alignment: .leading, spacing: 0){
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack{
                Text("Desired amount of sleep")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                VStack{
                    Text("Daily coffee intake")
                        .font(.headline)
                    Stepper("^[\(coffeAmount) cup](inflect: true)", value: $coffeAmount, in: 1...20)
                }
            }
            .padding()
            .navigationTitle("BetterRest")
            .toolbar{
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert){
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    func calculateBedtime(){
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration:config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "There was an error calculating your bedtime"
        }
        showingAlert = true
        
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
