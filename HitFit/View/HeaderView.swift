//
//  HeaderView.swift
//  HitFit
//
//  Created by Константин on 21.08.2023.
//

import SwiftUI

struct HeaderView: View {
    
    let TitleText: String
    
    var body: some View {
        
        VStack {
            
            Text(TitleText)
                .font(.largeTitle)
            HStack {
                Image(systemName: "hand.wave")
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                Image(systemName: "4.circle")
            }
            .font(.title2)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(TitleText: "Squat")
            .previewLayout(.sizeThatFits)
    }
}
