//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Alex on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        VStack{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("hello world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


// Colors and frames
//
//ZStack{
//    VStack(spacing: 0){
//        Color.red
//        Color.blue
//    }
//    Text("Your content")
//        .foregroundStyle(.secondary)
//        .padding(50)
//        .background(.ultraThinMaterial)
//}
////        .ignoresSafeArea()
///
///
///
/// Gradients:
///
/// RadialGradient(colors: [.blue, .black], center: .center
//, startRadius: 20, endRadius: 200)


//rainbow as background
//AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)


//subtle as gradient
//Text("Your content")
//    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
//    .foregroundStyle(.white)
//    .background(.cyan.gradient)


//Buttons

//create a destructive button:
//var body: some View {
//    Button("Delete selection", role: .destructive, action: executeDelete)
//}

/// lots of colored buttons:
 
// VStack{
//Button("Button 1") { }
//    .buttonStyle(.bordered)
//
//Button("Button 2", role: .destructive) { }
//    .buttonStyle(.bordered)
//
//Button("Button 1") { }
//    .buttonStyle(.borderedProminent)
//    .tint(.indigo)
//
//Button("Button 2", role: .destructive) { }
//    .buttonStyle(.borderedProminent)
//}

/// red button that you can tap
//Button{
//    print("Button was tapped")
//} label: {
//    Text("Tap me!")
//        .padding()
//        .foregroundColor(.white)
//        .background(.red)
//}

//image of pencil:
//Image(systemName: "pencil.circle")

//does same thing:
//Button("Edit", systemImage: "pencil"){
//    print("button was tapped")
//}

//red button
//Button{
//    print("Button was tapped")
//} label : {
//    Label("Edit", systemImage: "pencil")
//        .padding()
//        .foregroundStyle(.white)
//        .background(.red)
//}

// notification screen b4 dyanamic island that has a red and blue colored botton:
//Button("Show alert"){
//    showingAlert = true
//}
//.alert("Important message", isPresented: $showingAlert){
//    Button("Delete", role: .destructive) { }
//    Button("Cancel", role: .cancel) { }
//} message:{
//    Text("Please read this.")
//}
