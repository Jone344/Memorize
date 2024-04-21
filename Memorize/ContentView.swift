//
//  ContentView.swift
//  Memorize
//
//  Created by user on 11.04.24.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis = ["🤫", "🥱", "🤮", "😪", "🤤", "😴", "🤑", "🥴", "🤠", "🤧"]
    
    @State var cardCount = 10
        
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            
            ScrollView {
                cards
            }
            choiceThemeButton
        }
         .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
               // CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var choiceThemeButton: some View {
        HStack(alignment: .bottom, spacing: 50)
        {
            carButton
            animalsButton
            emojiButton
        }
        .imageScale(.large)
        .font(.title)
    }
    
    var emojisCarTheme = ["🚔", "🚍", "🚘", "🚖", "🛻", "🚒", "🚐", "🚚", "🚛", "🚜", "🛺", "🚕"]
    var carButton: some View {
        Button {
            cardCount = emojisCarTheme.count
            emojis = emojisCarTheme.shuffled()
        } label: {
            VStack {
                Image(systemName: "car.rear")
                Text("cars").font(.subheadline)
            }
        }
    }
    
    var emojisAnimalsTheme = ["🐶", "🐫", "🐭", "🦧", "🦁", "🐽", "🐸", "🐻"]
    var animalsButton: some View {
        Button {
            cardCount = emojisAnimalsTheme.count
            emojis = emojisAnimalsTheme.shuffled()
        } label: {
            VStack {
                Image(systemName: "pawprint.circle")
                Text("animals").font(.subheadline)
            }
        }
    }
    
    var emojisFaces = ["🤫", "🥱", "🤮", "😪", "🤤", "😴", "🤑", "🥴", "🤠", "🤧"]
    var emojiButton: some View {
        Button {
            cardCount = emojisFaces.count
            emojis = emojisFaces.shuffled()
        } label: {
            VStack {
            Image(systemName: "smiley")
                Text("faces").font(.subheadline)
            }
        }
    }

}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
