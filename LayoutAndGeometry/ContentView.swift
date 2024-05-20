//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Henrieke Baunack on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // geomretry reader expands to take all the available space
            GeometryReader { proxy in
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }.background(.green)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
