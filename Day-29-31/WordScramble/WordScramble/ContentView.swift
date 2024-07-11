//
//  ContentView.swift
//  WordScramble
//
//  Created by Alex on 7/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello worl")
    }
    
    func testStrings () {
//        let input = """
//        a
//        b
//        c
//        """
//        let letters = input.components(separatedBy: " ")
//        let letter = letters.randomElement()
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "Swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0 , length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
    }
}


#Preview {
    ContentView()
}

/// Listing with dynamic items:
//    var body: some View {
//var names = ["Josejuan", "Bob", "Toby" , "Takeoff"]
//List(names, id: \.self){
//    Text($0)
//}
//.listStyle(.grouped)
//}
