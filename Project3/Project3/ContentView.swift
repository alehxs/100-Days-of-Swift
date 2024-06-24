//
//  ContentView.swift
//  Project3
//
//  Created by Alex on 6/22/24.
//

import SwiftUI

//struct Title: ViewModifier{
//    func body(content: Content) -> some View {
//        content
//            .font(.largeTitle)
//            .foregroundStyle(.cyan)
//            .padding()
//    }
//}
//
//extension View{
//    func titleStyle() -> some View{
//        modifier(Title())
//    }
//}

///Create a custom ViewModifier (and accompanying View extension) that makes a view have a large, blue font suitable for prominent titles in a view.
struct Title: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.cyan)
            .padding()
    }
}

extension View{
    func titleStyle() -> some View{
        modifier(Title())
    }
}

struct Message: ViewModifier{
    func body(content: Content) -> some View{
        content
            .padding(12)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 15))
            
            
            
            
    }
}

extension View{
    func messageLook() -> some View{
        modifier(Message())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)

                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        Color.blue
            .frame(width:300, height: 200)
            .watermarked(with: "Hacking with Swift")
            .clipShape(.rect(cornerRadius: 10))
        
        
        VStack{
            Text("Hello world!!")
                .titleStyle()
            Text("sm")
                .messageLook()
        }
    }
}

#Preview {
    ContentView()
}

/// Conditionals recap
//let age = 18
//let canVote = age >= 18 ? "yes" : "no"
//                 w          t       f

/// Views as properties
//struct ContentView: View {
//    var motto1: some View{
//        Text("Dreaming of You")
//    }
//    
//    let motto2 = Text("Labios compartidos")
//    
//    @ViewBuilder var songs: some View{
//        Text("Sabor a mi")
//        Text("Magnetic")
//    }
//
//    var body: some View {
//        VStack{
//            motto1
//                .foregroundColor(.red)
//            motto2
//                .foregroundStyle(.blue)
//        }
//    }
//}


/// View Composition
//struct CapsuleText: View {
//var text: String
//
//var body: some View {
//    Text(text)
//        .font(.largeTitle)
//        .padding()
//        .background(.blue)
//        .clipShape(.capsule)
//}
//}
//
//struct ContentView: View {
//var body: some View {
//    VStack(spacing: 10){
//        CapsuleText(text: "first")
//            .foregroundStyle(.white)
//        CapsuleText(text: "second")
//            .foregroundStyle(.red)
//                    
//        
//    }
//}
//}
