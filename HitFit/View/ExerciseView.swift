//
//  ExerciseView.swift
//  HitFit
//
//  Created by Константин on 21.08.2023.
//

import SwiftUI
import AVKit

struct ExerciseView: View {

    let index: Int
    var exercise: Exercise { Exercise.exercises[index] }
    
    @State private var timerDone: Bool = false
    @State private var showTimer: Bool = false
    @State private var showHistory = false
    
    @State private var showSuccess: Bool = false
    @Binding var selectedTab: Int
    @EnvironmentObject var history: HistoryStore

    var startButton: some View {
        Button("start exercise") {
              showTimer.toggle()
        }
    }
    
    var lastExercise: Bool { // явл ли последним упраж
        index + 1 == Exercise.exercises.count
    }
    
    var buttonDone: some View {
        
        Button("done") {
            history.addDoneExercise(Exercise.exercises[index].exerciseName)
            timerDone = false
            showTimer.toggle()
            
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
        }
    }
    
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
                    .padding(.bottom)

                VideoPlayerView(videoName: exercise.videoName)
                  .frame(height: geometry.size.height * 0.45)
                
              
                HStack(spacing: 150) {
                  startButton
                    buttonDone
                  .disabled(!timerDone)
                  .sheet(isPresented: $showSuccess) {
                    SuccessView(selectedTab: $selectedTab)
                      .presentationDetents([.medium, .large])
                  }
                }
                .font(.title3)
                .padding()

                if showTimer {
                  TimerView(
                    timerDone: $timerDone,
                    size: geometry.size.height * 0.07
                  )
                }
                
                Spacer()
                
                RatingView(exerciseIndex: index) 
                  .padding()
                
                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                  HistoryView(showHistory: $showHistory)
                }
                  .padding(.bottom)
            }

        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(index: 0, selectedTab: .constant(0))
            .environmentObject(HistoryStore())
    }
}




