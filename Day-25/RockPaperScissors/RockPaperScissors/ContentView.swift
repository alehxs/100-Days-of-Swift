//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alex on 6/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var choices = ["Rock", "Paper", "Scissors"]
    @State private var needToWin = true
    
    
    
    
    var body: some View {
        ZStack{
            LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(1.5),
                                
                                Color.cyan.opacity(1.2) //
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Rock, Paper, or Scissors?")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 20){
                    HStack{
                        Text("LOSE")
                            .font(.system(size:25).bold())
                            .foregroundColor(.red)
                            .shadow(radius: 100)
                        Text("against")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        
                    }
                    Spacer()
                    
                }
            Spacer()
            }
            
            
        }
        
        
    }
}

#Preview {
    ContentView()
}
