//
//  WelcomeView.swift
//  HitFit
//
//  Created by Константин on 21.08.2023.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var showHistory = false
    @Binding var selectedTab: Int
    
    var body: some View {
        
        ZStack {
            
            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Get fit")
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }
                    Image("step-up")
                        .resizedToFill(width: 240, height: 240)
                        .clipShape(Circle())
                }
                Button(action: { selectedTab = 0 }) {
                    Text("Get Started")
                    Image(systemName: "arrow.right.circle")
                    //                    Label("Get Started", systemImage: "arrow.right.circle")
                    //                        .labelStyle(.titleAndIcon)
                    
                }
                .font(.title2)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 2)
                )
            }
            
            VStack {
                
                Text("Welcome")
                    .font(.largeTitle)
//                HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
                
                Spacer()
                
                Button("History") { showHistory.toggle() }
                    .padding(.bottom)
            }
            .sheet(isPresented: $showHistory) {
                HistoryView(showHistory: $showHistory)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
    }
}
