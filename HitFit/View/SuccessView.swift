//
//  SuccessView.swift
//  HitFit
//
//  Created by Константин on 22.08.2023.
//

import SwiftUI

struct SuccessView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int
    
    var body: some View {
        
        VStack {
            
          Image(systemName: "hand.raised.fill")
            .resizedToFill(width: 75, height: 75)
            .foregroundColor(.purple)
            
          Text("High Five!")
            .font(.largeTitle)
            .fontWeight(.bold)
            
          Text("""
            Good job completing all four exercises!
            Remember tomorrow's another day.
            So eat well and get some rest.
            """)
          .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            
            Button("Continue") {
                dismiss()
                selectedTab = 9
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3))
    }
}
