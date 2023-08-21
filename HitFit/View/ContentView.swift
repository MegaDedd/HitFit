//
//  ContentView.swift
//  HitFit
//
//  Created by Константин on 21.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            WelcomeView()
            
            ForEach(Exercise.exercises.indices, id: \.self) { index in
                ExerciseView(index: index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(
            PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
