//
//  ContentView.swift
//  Memorize
//
//  Created by Joabe Santana Correia on 10/10/22.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["❤️","😍","😘","🥰","🥶","🫣","✈️"]
    
    var body: some View {
        HStack {
            ForEach (0..<emojis.count, id: \.self) { emoji in
                CardView(content: emojis[emoji])
            }
        }
        .padding()
    }
}

struct CardView: View {
    
    var content: String = "⁇"
    @State var faceUp: Bool = true
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack{
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
            .previewDevice("iPhone 12 Pro Max")
    }
}
