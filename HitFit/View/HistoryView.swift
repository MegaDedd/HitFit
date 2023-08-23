//
//  HistoryView.swift
//  HitFit
//
//  Created by Константин on 21.08.2023.
//

import SwiftUI

struct HistoryView: View {
    
    @EnvironmentObject var history: HistoryStore
    @Binding var showHistory: Bool

    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            Button { showHistory.toggle() } label: {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding()

            
            VStack {
                Text("History")
                    .font(.title)
                    .padding()
                
                Form {
                    
                    ForEach(history.exerciseDays) { day in
                        
                        Section {
                            ForEach(day.exercises, id: \.self) { exercice in
                                Text(exercice)
                            }
                        } header: {
                            Text(day.date.formatted(as: "d MMM"))
                                .font(.headline)
                        }
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
            .previewLayout(.sizeThatFits)
            .environmentObject(HistoryStore())
    }
}
