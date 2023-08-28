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
    
    var getStartedButton: some View {
        RaisedButton(buttonText: "Get Started") {
            selectedTab = 0
        }
        .padding()
    }
    
    var historyButton: some View {
        Button(
            action: {
                showHistory = true
            }, label: {
                Text("History")
                    .fontWeight(.bold)
                    .padding([.leading, .trailing], 5)
            })
        .padding(.bottom, 10)
        .buttonStyle(EmbossedButtonStyle())
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: "Welcome")
                Spacer()
                
                ContainerView {
                    // если экран будет мал для отображения всего содержимого,
                    // то images не будут оотбражаться
                    ViewThatFits {
                        VStack {
                            WelcomeView.images
                            WelcomeView.welcomeText
                            getStartedButton
                            Spacer()
                            historyButton
                        }
                        VStack {
                            WelcomeView.welcomeText
                            getStartedButton
                            Spacer()
                            historyButton
                        }
                    }
                }
                .frame(height: geometry.size.height * 0.8)
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
