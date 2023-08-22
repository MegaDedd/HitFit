//
//  HeaderView.swift
//  HitFit
//
//  Created by Константин on 21.08.2023.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var selectedTab: Int
    let titleText: String
    
    var body: some View {
        
        VStack {
            
          Text(titleText)
            .font(.largeTitle)
            
          HStack {
              
            ForEach(Exercise.exercises.indices, id: \.self) { index in
              let fill = index == selectedTab ? ".fill" : ""
              Image(systemName: "\(index + 1).circle\(fill)")
                
                .onTapGesture {
                        selectedTab = index
                    print(index)
                }
            }
          }
          .font(.title2)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(selectedTab: .constant(9), titleText: "Squat")
            .previewLayout(.sizeThatFits)
    }
}
