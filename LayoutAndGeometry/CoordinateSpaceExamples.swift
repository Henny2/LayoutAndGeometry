//
//  CoordinateSpaceExamples.swift
//  LayoutAndGeometry
//
//  Created by Henrieke Baunack on 5/19/24.
//

import SwiftUI

struct CoordinateSpaceExamples: View {
    var body: some View {
        VStack{
            Text("TOP")
            GeometryReader { proxy in
                Text("Press here!")
                    .onTapGesture {
                        print("Glaobal coordinates: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY)")
                        print("Local coordinates:\(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY)")
                        print("Custom coordinates: \(proxy.frame(in: .named("Custom")).midX) x \(proxy.frame(in: .named("Custom")).midY)")
                        
                    }
            }
            Text("BOTTOM")
        }.coordinateSpace(name:"Custom")
    }
}

#Preview {
    CoordinateSpaceExamples()
}
