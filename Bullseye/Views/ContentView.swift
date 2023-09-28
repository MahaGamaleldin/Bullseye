//
//  ContentView.swift
//  Bullseye
//
//  Created by Maha on 8/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯 🎯 🎯\n PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
                    .bold()
            }
            Button("Hit me") {
                alertIsVisible = true
            }
            .alert(
                "Hello there",
                isPresented: ($alertIsVisible),
                actions: {
                    Button("Awsome") {
                    }
                }, message: {
                    let roundedValue = Int(sliderValue.rounded())
                    Text("The slider value is: \(roundedValue)\n you scored:\(game.points(sliderValue: roundedValue))")
                }
            )

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
