//
//  ContentView.swift
//  HitFit
//
//  Created by Константин on 21.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Problem:
    /* SceneStorage повторно инициализирует TabView,когда сохраняет selectedTab, поэтому когда меняем вкладку,то повторно инициализируется HistoryStore. Если сделать упражнение, то история не сохранится.
     */
    
    @SceneStorage("selectedTab") private var selectedTab = 9
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            WelcomeView(selectedTab: $selectedTab)
            
            ForEach(Exercise.exercises.indices, id: \.self) { index in
                ExerciseView(index: index, selectedTab: $selectedTab)
            }
        }
         // MARK: Solution Problem:
        /*
         // происходит переинициализация
           .environmentObject(HistoryStore())
         */
        
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(
            PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
