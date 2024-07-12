//
//  ContentView.swift
//  WordScramble
//
//  Created by Alex on 7/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var playerScore = 0

    var body: some View {
        VStack{
            NavigationStack {
                VStack{
                    List {
                        Section {
                            TextField("Enter your word", text: $newWord)
                                .textInputAutocapitalization(.never)
                        }
                            
                        Section {
                            ForEach(usedWords, id: \.self)  {word in
                                HStack{
                                    Image(systemName: "\(word.count).circle")
                                    Text(word)
                                }
                            }
                        }
                    }
                    .navigationTitle(rootWord)
                    .onSubmit(addNewWord)
                    .onAppear(perform: startGame)
                    .alert(errorTitle, isPresented: $showingError){} message: { Text(errorMessage) }
                    .toolbar {
                        ToolbarItemGroup() {
                            Button(action: {
                                startGame()
                            }) {
                                Image(systemName: "arrow.clockwise")
                            }
                        }
                    }
                }
            }
            Section{
                Text("Score: \(playerScore)")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isValidLength(word: answer) else {
                wordError(title: "Word too short", message: "Your word is too short")
                return
            }
        
        guard isNotRootword(word: answer) else{
            wordError(title: "Word is rootword", message: "You cannot use the rootword!")
            return
        }
        
        withAnimation{
            usedWords.insert(answer, at: 0)
        }
        calculatePoints(word: answer)
        newWord = ""
    }
    
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")

                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"

                // If we are here everything has worked, so we can exit
                return
            }
        }

        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool{
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool{
        var tempWord = rootWord
        
        for letter in word{
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            } else{
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }

    func isValidLength(word: String) -> Bool{
        return word.count >= 3
    }
    
    func isNotRootword(word: String) -> Bool{
        return word != rootWord
    }
    
    func wordError(title: String, message: String){
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func calculatePoints(word: String){
        switch word.count {
        case 3...4:
            playerScore += 1
        case 5...6:
            playerScore += 2
        case 7...8:
            playerScore += 3
        default:
            break
        }
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


///Spellchecker API

//func testStrings () {
////        let input = """
////        a
////        b
////        c
////        """
////        let letters = input.components(separatedBy: " ")
////        let letter = letters.randomElement()
////        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
//    
//    let word = "Swift"
//    let checker = UITextChecker()
//    
//    let range = NSRange(location: 0 , length: word.utf16.count)
//    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//    
//    let allGood = misspelledRange.location == NSNotFound
//}
