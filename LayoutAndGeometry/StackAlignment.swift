//
//  StackAlignment.swift
//  LayoutAndGeometry
//
//  Created by Henrieke Baunack on 4/28/24.
//

import SwiftUI

struct StackAlignment: View {
    var body: some View {
        // all the views have different sizes so they don't aling on the actual text
        HStack(alignment: .bottom){
            Text("small")
                .font(.caption)
            Text("medium")
            Text("large")
                .font(.title)
            Text("extraLarge")
                .font(.largeTitle)
        }
        // firstTextBaseline uses the baseline of the text for aligning 
        HStack(alignment: .firstTextBaseline){
            Text("small")
                .font(.caption)
            Text("medium")
            Text("large")
                .font(.title)
            Text("extraLarge")
                .font(.largeTitle)
        }
        
    }
}

#Preview {
    StackAlignment()
}
