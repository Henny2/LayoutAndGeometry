//
//  ChallengeView.swift
//  LayoutAndGeometry
//
//  Created by Henrieke Baunack on 5/20/24.
//

import SwiftUI

struct ChallengeView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

        var body: some View {
            GeometryReader { fullView in
                ScrollView(.vertical) {
                    ForEach(0..<50) { index in
                        GeometryReader { proxy in
                            Text("Row #\(index)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .background(colors[index % 7])
                                .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                        }
                        .frame(height: 40)
                    }
                }
            }
        }
}

#Preview {
    ChallengeView()
}