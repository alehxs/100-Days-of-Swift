//
//  ContentView.swift
//  WeSplit
//
//  Created by Alex on 6/14/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @State private var grandTotal = 0.0
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmount: Double {
        let tipValue = checkAmount / 100 * Double(tipPercentage)
        
        return checkAmount + tipValue
    }
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View{
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                Section("How much do you want to tip?"){
                    Picker("Tip Percentage", selection: $tipPercentage){
//                        ForEach(tipPercentages, id: \.self){
                        ForEach(0..<101){
                            Text($0, format: .percent)
                        }
                    }
//                    .pickerStyle(.segmented)
                    .pickerStyle(.navigationLink)
                }
                Section("Grand total"){
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Amount per person"){
                    Text(totalPerPerson, format: .currency( code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


// Button that increases counts on click

//@State private var tapCount = 0
//
//var body: some View {
//    Button("Tap count: \(tapCount)"){
//        tapCount += 1
//    }
//}

//create a form

//@State private var name = ""
//
//var body: some View{
//    Form{
//        TextField("Enter your name", text: $name)
//        Text("Your name is \(name)")
//    }
//}

//create a drop down menu of the names in array

//let students = ["Harry", "Hermione", "Ron"]
//@State private var selectedStudent = "Harry"
//
//var body: some View {
//    NavigationStack {
//        Form {
//            Picker("Select your student", selection: $selectedStudent) {
//                ForEach(students, id: \.self) {
//                    Text($0)
//                }
//            }
//        }
//        .navigationTitle("Select a Student! 🤓")
//    }
//}
