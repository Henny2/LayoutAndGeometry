//
//  VisualEffectExample.swift
//  LayoutAndGeometry
//
//  Created by Henrieke Baunack on 5/19/24.
//

import SwiftUI

struct VisualEffectExample: View {
    let colors: [Color] = [.red, .pink, .green, .blue, .green, .purple, .yellow]
    var body: some View {
        ScrollView(.horizontal){
            HStack (spacing: 0){
                ForEach(0..<50){ index in
                        Text("Row #\(index)")
                            .font(.title)
                            .padding()
                            .frame(width:200, height:200)
                            .background(colors[index%7])
                            .visualEffect { content, proxy in
                                content.rotation3DEffect(.degrees((-proxy.frame(in: .global).minX)/8), axis: (x: 0, y: 1, z: 0))
                            }
                    }
//                    .background(.gray)
//                    .frame(width: 200, height: 200)
                
            }
            .scrollTargetLayout()
        }.scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    VisualEffectExample()
}
