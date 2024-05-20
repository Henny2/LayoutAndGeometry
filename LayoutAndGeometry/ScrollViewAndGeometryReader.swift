//
//  ScrollViewAndGeometryReader.swift
//  LayoutAndGeometry
//
//  Created by Henrieke Baunack on 5/19/24.
//

import SwiftUI

struct ScrollViewAndGeometryReader: View {
    let colors: [Color] = [.red, .pink, .green, .blue, .green, .purple, .yellow]
    var body: some View {
        ScrollView(.vertical){
                ForEach(0..<50){ index in
                    GeometryReader{ proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
//                            .frame(width: 200, height:20)
                            .background(colors[index%7])
                            .rotation3DEffect(
                                .degrees(proxy.frame(in: .global).minY/5),
                                axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                            )
                    }
//                    .background(.gray)
                    .frame(height: 40)
            }
        }
    }
}

#Preview {
    ScrollViewAndGeometryReader()
}
