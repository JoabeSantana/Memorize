//
//  ContentView.swift
//  Memorize
//
//  Created by Joabe Santana Correia on 10/10/22.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚀","🚂","🚁","🚃","🚄","🚌","🚒","🚔","🚚","🚜","🚞","🚢","🚤","🚲","🏍","🏎","🛴","🛵","🛺","🛻","⛵️","✈️","🚑","🛶"]
    
    @State var emojiCount = 1
    var body: some View {
        VStack{
            HStack {
                ForEach (emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                surfle
                Spacer()
                add
            }.font(.largeTitle)
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .foregroundColor(.red)
    }
    
    var add: some View {
        Button {
            if(emojiCount < emojis.count){
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
        .padding(.trailing)
        //        .disabled(emojiCount == 24 ? true : false)
    }
    
    var surfle: some View {
        Button(action: {  }, label: {
            VStack{
                Text("Sufle").foregroundColor(Color.red)
            }
        })
    }
    
    var remove: some View {
        Button {
            if(emojiCount > 1){
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
        .padding(.leading)
        //        .disabled(emojiCount == 1 ? true : false)
    }
}

struct CardView: View {
    
    var content: String = "⁇"
    @State var faceUp: Bool = true
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if(faceUp){
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 4).foregroundColor(.red)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
            
        }.onTapGesture {
            faceUp = !faceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 Pro Max")
    }
}
