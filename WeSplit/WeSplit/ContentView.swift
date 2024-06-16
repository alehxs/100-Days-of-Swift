//
//  ContentView.swift
//  WeSplit
//
//  Created by Alex on 6/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        Text("hello worl!!")
    }
    
}

#Preview {
    ContentView()
}


// Button that increaes counts on click

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
