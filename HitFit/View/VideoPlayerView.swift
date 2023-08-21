//
//  VideoPlayerView.swift
//  HitFit
//
//  Created by Константин on 21.08.2023.
//

import SwiftUI

struct VideoPlayerView: View {
    
    var videoName: String
    
    var body: some View {
        
        Image(videoName)
            .resizable()
        
        // MARK: VideoPlayer
        /*
         if let url = Bundle.main.url(forResource: exercise.videoName, withExtension: "mp4") {
     //                  VideoPlayer(player: AVPlayer(url: url))
     //                    .frame(height: geometry.size.height * 0.45)
     //                } else {
     //                    Text("Couldn't find \(exercise.videoName).mp4")
     //                      .foregroundColor(.red)
     //                }
        */
    }
}
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(videoName: "squatVideo")
    }
}
