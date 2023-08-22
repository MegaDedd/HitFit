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
    let interval: TimeInterval = 30
    
    @State private var rating = 0
    @State private var showSuccess: Bool = false
    @Binding var selectedTab: Int

    var startButton: some View {
        Button("start exercise") { }
    }
    
    var lastExercise: Bool { // явл ли последним упраж
        index + 1 == Exercise.exercises.count
    }
    
    var buttonDone: some View {
        Button("done") {
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
            
        }
    }
    
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
                    .padding(.bottom)

                VideoPlayerView(videoName: exercise.videoName)
                  .frame(height: geometry.size.height * 0.45)
                
                Text(Date().addingTimeInterval(interval), style: .timer)
                  .font(.system(size: geometry.size.height * 0.07))
                
                HStack(spacing: 150) {
                    startButton
                    buttonDone
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.large, .medium])
                        }
                }
                .font(.title3)
                .padding()
                
                RatingView(rating: $rating)
                    .padding()
                
                Spacer()
                
                Button("History") { }
                  .padding(.bottom)
            }

        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(index: 3, selectedTab: .constant(3))
    }
}




