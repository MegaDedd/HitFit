//
//  HistoryStore.swift
//  HitFit
//
//  Created by Константин on 22.08.2023.
//

import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}

struct HistoryStore {
    
    var exerciseDays: [ExerciseDay] = []

    // не появится в компиляции
    init() {
      #if DEBUG
      createDevData()
      #endif
    }
    
}


