//
//  ContentView.swift
//  SwiftUIMarathon3
//
//  Created by @_@ on 07.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var offset: CGFloat = 0
    @State private var scale: CGFloat = 1

    var body: some View {
        Button {
            withAnimation(
                Animation.spring(duration: 0.4, bounce: 0.3)
            ) {
                scale = 0
                offset = 31
            } completion: {
                scale = 1
                offset = 0
            }
        } label: {
            buttonLabel()
        }
    }
    
    private func buttonLabel() -> some View {
        HStack(spacing: -1) {
            ZStack {
                playImage()
                    .scaleEffect(1 - scale, anchor: .leading)
                playImage()
                    .offset(x: offset)
            }
            playImage()
                .scaleEffect(scale, anchor: .trailing)
        }
    }
    
    private func playImage() -> some View {
        Image(systemName: "play.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 32)
    }
}

#Preview {
    ContentView()
}
