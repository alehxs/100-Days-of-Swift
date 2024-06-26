//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Alex on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var questionCount = 0
    
    @State private var userScore = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var selectedFlagIndex: Int? = nil
    
    
///    Go back to project 2 and replace the Image view used for flags with a new FlagImage() view that renders one flag image using the specific set of modifiers we had.
    
    struct FlagImage: View{
        var imageName: String
        
        var body: some View{
            Image(imageName)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
        }
        
    }
    var body: some View{
        ZStack{
            AngularGradient(gradient: Gradient(colors: [
                Color(red: 0.1, green: 0.0, blue: 0.3),
                Color(red: 0.3, green: 0.0, blue: 0.5),
                Color(red: 0.5, green: 0.0, blue: 0.7),
                Color(red: 0.7, green: 0.0, blue: 0.9),
                Color(red: 0.9, green: 0.1, blue: 0.7),
                Color(red: 0.7, green: 0.0, blue: 0.5),
                Color(red: 0.5, green: 0.0, blue: 0.3),
                Color(red: 0.3, green: 0.0, blue: 0.1),
                Color(red: 0.1, green: 0.0, blue: 0.3)
            ]), center: .center)
            .ignoresSafeArea()
            .blur(radius: 0.5)
            
            VStack{
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15){
                    VStack(){
                        Text("Tap the flag of")
                            .foregroundStyle(.fill)
                            .font(.subheadline.weight(.semibold))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.heavy))
                    }
                    
                    ForEach(0..<3) {number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(imageName: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if userScore < 8 {
                Button("Continue", action: askQuestion)
            } else {
                Button("Restart", action: resetGame)
            }
        } message: {
            if userScore < 8 {
                Text("Your score is \(userScore)")
            } else {
                Text("Congratulations! You got 8 questions right!")
            }
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer{
            scoreTitle = "Correct"
            userScore += 1
        } else{
            scoreTitle = "Wrong, that is \(countries[number])!"
        }
        showingScore = true
    }
    
    func askQuestion() {
        if questionCount < 8 {
            questionCount += 1
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        } else{
            resetGame()
        }
    }
    
    func resetGame() {
        userScore = 0
        questionCount = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview  {
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
