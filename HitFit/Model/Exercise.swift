//
//  Exercise.swift
//  HitFit
//
//  Created by Константин on 21.08.2023.
//

import Foundation

struct Exercise {
  let exerciseName: String
  let videoName: String

  enum ExerciseEnum: String {
    case squat = "Squat"
    case stepUp = "Step Up"
    case burpee = "Burpee"
    case sunSalute = "Sun Salute"
  }
}

extension Exercise {
    
    static let exercises = [
        Exercise(
            exerciseName: ExerciseEnum.squat.rawValue,
            videoName: "squatVideo"),
        Exercise(
            exerciseName: ExerciseEnum.stepUp.rawValue,
            videoName: "step-upVideo"),
        Exercise(
            exerciseName: ExerciseEnum.burpee.rawValue,
            videoName: "burpeeVideo"),
        Exercise(
            exerciseName: ExerciseEnum.sunSalute.rawValue,
            videoName: "sun-saluteVideo")
    ]
}
